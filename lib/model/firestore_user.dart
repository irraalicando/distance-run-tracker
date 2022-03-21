import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreUser {
  String id;
  String tempName;
  int timestamp;

  FirestoreUser({required this.id, required this.tempName, required this.timestamp});


  Map<String, dynamic> toJson() {
    return {
      'name': tempName,
      'timestamp': timestamp,
    };
  }

  factory FirestoreUser.fromDocument(DocumentSnapshot doc) {
    String tempName = "";
    int timestamp = 0;
    try {
      tempName = doc.get('name');
    } catch (e) {}
    try {
      timestamp = doc.get('timestamp');
    } catch (e) {}
    return FirestoreUser(
      id: doc.id,
      tempName: tempName,
      timestamp: timestamp,
    );
  }
}
