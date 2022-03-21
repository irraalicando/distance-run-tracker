import 'package:cloud_firestore/cloud_firestore.dart';

class Distance {
  String? id;
  String user;
  double distanceInKm;
  int timestamp;

  Distance({this.id, required this.user, required this.distanceInKm, required this.timestamp});

  @override
  String toString() {
    return 'Distance{id: $id, login: $user, distanceInKm: $distanceInKm, timestamp: $timestamp}';
  }

  Map<String, dynamic> toJson() {
    return {
      'login': user,
      'distance_in_km': distanceInKm,
      'timestamp': timestamp,
    };
  }

  factory Distance.fromDocument(DocumentSnapshot doc) {
    String user = "";
    double distanceInKm = 0.0;
    int timestamp = 0;
    try {
      user = doc.get('login');
    } catch (e) {
      rethrow;
    }
    try {
      distanceInKm = doc.get('distance_in_km');
    } catch (e) {
      rethrow;
    }
    try {
      timestamp = doc.get('timestamp');
    } catch (e) {
      rethrow;
    }
    return Distance(
      id: doc.id,
      user: user,
      distanceInKm: distanceInKm,
      timestamp: timestamp,
    );
  }
}
