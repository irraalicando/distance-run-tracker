import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:distance_run_tracker/data/constants/repository_constants.dart';
import 'package:distance_run_tracker/model/distance.dart';


class DistanceRepository {
  final FirebaseFirestore firebaseFirestore;

  DistanceRepository({
    required this.firebaseFirestore,
  });

  Future<bool> submitDistance(Distance distance) async {
    try{
      await firebaseFirestore
          .collection(RepositoryConstants.userDistanceCollectionPath).doc().set(distance.toJson());
      return true;
    }
    catch(e){
      return false;
    }
  }

  Future<bool> updateDistance(Distance distance) async {
    try{
      await firebaseFirestore
          .collection(RepositoryConstants.userDistanceCollectionPath).doc(distance.id).update(distance.toJson());
      return true;
    }
    catch(e){
      return false;
    }
  }

  Stream<QuerySnapshot> getAllDistanceListStream() {
    return firebaseFirestore
        .collection(RepositoryConstants.userDistanceCollectionPath)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getUsersDistanceListStream(String userId) {
    return firebaseFirestore
        .collection(RepositoryConstants.userDistanceCollectionPath)
        .where('login', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<bool> deleteEntry(Distance distance) async {
    try{
      await firebaseFirestore
          .collection(RepositoryConstants.userDistanceCollectionPath).doc(distance.id).delete();
      return true;
    }
    catch(e){
      return false;
    }
  }

}
