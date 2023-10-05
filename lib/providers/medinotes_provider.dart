import 'package:Medinote/utils/translit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Medinote/models/medinote_model.dart';

final medinotesProvider = FutureProvider((ref) async {
  final medinotes = (await FirebaseFirestore.instance
      .collection(
      'medinotes/${FirebaseAuth.instance.currentUser!.uid}/data')
      .get())
      .docs
      .map((m) => Medinote.fromJson(m.data()))
      .toList();

  medinotes.sort((m1, m2) => localCompare(m1.name.toUpperCase(), m2.name.toUpperCase()));

  return medinotes;
});