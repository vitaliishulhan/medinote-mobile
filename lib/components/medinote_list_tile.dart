import 'package:Medinote/models/medinote_model.dart';
import 'package:flutter/material.dart';
import 'package:Medinote/pages/medinote/medinote_page.dart';

import 'medinote_text.dart';


class MedinoteListTile extends StatelessWidget {
  final Medinote medinote;

  const MedinoteListTile(this.medinote, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MedinoteText(medinote.name),
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MedinotePage(medinote),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ));
      },
    );
  }
}
