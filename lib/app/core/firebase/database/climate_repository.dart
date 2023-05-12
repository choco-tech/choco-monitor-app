import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ClimateRepository {
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  getAll() async {
    DatabaseReference roomRef = FirebaseDatabase.instance.ref('data/room1/');

    roomRef.onValue.listen((DatabaseEvent event) {
      debugPrint(event.snapshot.value.toString());

      // if (data != null) {
      //   final map = Map<String, dynamic>.from(data);
      //   debugPrint(map.keys.last);
      // }
    });

    // return {temperature, humidity};
  }
}
