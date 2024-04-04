import 'package:firebase_database/firebase_database.dart';

class ClimateRepository {
  final database = FirebaseDatabase.instance;

  Stream<DatabaseEvent> onUpdate(String roomId) {
    DatabaseReference roomRef = database.ref('data/$roomId/');

    return roomRef.onValue;
  }
}
