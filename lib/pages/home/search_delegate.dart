import 'dart:math';
import 'package:Medinote/components/medinote_list_tile.dart';
import 'package:Medinote/models/medinote_model.dart';
import 'package:flutter/material.dart';


class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  final List<Medinote> medinotes;

  CustomSearchDelegate(this.medinotes);

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) => _build();

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) => _build();

  Widget _build() {
    List<Medinote> matchQuery = [];
    final loweredQuery = query.toLowerCase();
    for (var medinote in medinotes) {
      final loweredName = medinote.name.toLowerCase();
      if (loweredName.contains(loweredQuery) || levenshteinDistance(loweredName, loweredQuery) <= 2) {
        matchQuery.add(medinote);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return MedinoteListTile(result);
      },
    );
  }

  int levenshteinDistance(String s1, String s2) {
    final len1 = s1.length;
    final len2 = s2.length;

    final List<List<int>> table = [];

    for (var i = 0; i <= len1; i++) {
      table.add(List.generate(len2 + 1, (index) => 0));
    }

    for (var i = 0; i <= len1; i++) {
      table[i][0] = i;
    }

    for (var i = 0; i <= len2; i++) {
      table[0][i] = i;
    }

    for (var i = 1; i <= len1; i++) {
      for (var j = 1; j <= len2; j++) {
        final cost = s1[i - 1] == s2[j - 1] ? 0 : 1;

        table[i][j] = <int>[
          table[i - 1][j] + 1,
          table[i][j - 1] + 1,
          table[i - 1][j - 1] + cost
        ].reduce(min);
      }
    }

    return table[len1][len2];
  }
}
