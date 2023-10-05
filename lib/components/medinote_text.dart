import 'package:flutter/material.dart';

class MedinoteText extends StatelessWidget {
  final String text;

  const MedinoteText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _medinoteTextStyle,
    );
  }
}

const TextStyle _medinoteTextStyle = TextStyle(fontSize: 24);
