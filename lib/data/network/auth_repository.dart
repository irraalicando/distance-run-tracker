import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:distance_run_tracker/data/constants/repository_constants.dart';
import 'package:distance_run_tracker/model/firestore_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../local/shared_preferences.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final SharedPreferences prefs;

  AuthRepository({
    required this.firebaseAuth,
    required this.prefs,
    required this.firebaseFirestore,
  });

  Future<String> getUserAuthId() async {
    return await prefs.user;
  }

  Future<bool> getIsLoggedIn() async {
    return (await prefs.user) != '-';
  }

  Future<bool> signInAnonymously(String name) async {
    var result = false;

    User? firebaseUser = (await firebaseAuth.signInAnonymously()).user;
    if (firebaseUser != null) {
      FirestoreUser user = FirestoreUser(
          id: firebaseUser.uid,
          tempName: name,
          timestamp: DateTime.now().millisecondsSinceEpoch);
      await firebaseFirestore
          .collection(RepositoryConstants.userCollectionPath)
          .doc(firebaseUser.uid)
          .set(user.toJson());

      await prefs.saveUser('${user.id}-$name');

      result = true;
    }
    return result;
  }

  Future<void> handleSignOut() async {
    await prefs.saveUser('-');
    await firebaseAuth.signOut();
  }
}
