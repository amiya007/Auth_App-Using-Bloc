import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var firestore = FirebaseFirestore.instance;
final firebaseAuth = FirebaseAuth.instance;
String name = '';

TextStyle myTextStyle = const TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

InputDecoration myTextfieldDecoration = InputDecoration(
  enabled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  filled: true,
  fillColor: Colors.grey[300],
  labelText: 'name',
);

ButtonStyle myButtonDecoration = ButtonStyle(
  elevation: const MaterialStatePropertyAll(6),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: const BorderSide(color: Colors.indigo))),
  backgroundColor: MaterialStateProperty.all(Colors.indigo),
);

Future getData(id) async {
  DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(id).get();
  name = snapshot.get('name');
}
