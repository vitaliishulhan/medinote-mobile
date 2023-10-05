import 'package:Medinote/components/medinote_list_tile.dart';
import 'package:Medinote/pages/home/list_item.dart';
import 'package:Medinote/pages/home/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:azlistview/azlistview.dart';

import '../../providers/medinotes_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medinotes = ref.watch(medinotesProvider);

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Medinote'),
        actions: medinotes.when<List<Widget>>(
          loading: () => [],
          error: (err, stack) => [],
          data: (medinotes) => [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.refresh(medinotesProvider);
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(medinotes));
              },
            ),
          ],
        ),
      ),
      body: medinotes.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Text('Error: $err'),
        data: (medinotes) {
          return AzListView(
            indexBarData: alphabet,
            itemCount: medinotes.length,
            itemBuilder: (context, index) {
              return MedinoteListTile(medinotes[index]);
            },
            data: medinotes.map((m) => ListItem(medinote: m)).toList(),
          );
        },
      ),
    );
  }
}

const alphabet = [
  "А",
  "Б",
  "В",
  "Г",
  "Ґ",
  "Д",
  "Е",
  "Є",
  "Ж",
  "З",
  "И",
  "І",
  "Ї",
  "Й",
  "К",
  "Л",
  "М",
  "Н",
  "О",
  "П",
  "Р",
  "С",
  "Т",
  "У",
  "Ф",
  "Х",
  "Ц",
  "Ч",
  "Ш",
  "Щ",
  "Ь",
  "Ю",
  "Я",
  "#"
];
