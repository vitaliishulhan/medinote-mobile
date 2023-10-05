import 'package:flutter/material.dart';
import '../../models/medinote_model.dart';

class MedinotePage extends StatelessWidget {
  final Medinote medinote;

  const MedinotePage(this.medinote, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Назва', style: headlineStyle),
              Text(medinote.name, style: paragraphStyle),
              const SizedBox(height: 16),
              Text('Діюча речовина', style: headlineStyle),
              Text(medinote.activeFluid, style: paragraphStyle),
              const SizedBox(height: 16),
              Text('Дозування', style: headlineStyle),
              Text(medinote.dosage, style: paragraphStyle),
              if (medinote.note.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text('Нотатка', style: headlineStyle),
                    Text(medinote.note, style: paragraphStyle),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

final headlineStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

final paragraphStyle = TextStyle(fontSize: 24);
