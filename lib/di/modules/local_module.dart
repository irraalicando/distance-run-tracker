import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:distance_run_tracker/data/network/distance_repository.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../data/local/shared_preferences.dart';
import '../../data/network/auth_repository.dart';

@module
abstract class LocalModule {

  static Future<EncryptedSharedPreferences> provideSharedPreferences() async{
    return EncryptedSharedPreferences();
  }

  static Future<AuthRepository> provideAuthRepo() async{
    return AuthRepository(
      firebaseFirestore: FirebaseFirestore.instance,
      prefs: SharedPreferences(EncryptedSharedPreferences()),
      firebaseAuth: FirebaseAuth.instance
    );
  }

  static Future<DistanceRepository> provideDistanceRepo() async{
    return DistanceRepository(
        firebaseFirestore: FirebaseFirestore.instance
    );
  }
}
