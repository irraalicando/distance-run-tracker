import 'dart:async';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

import '../constants/shared_preferences_constants.dart';


class SharedPreferences {

  final EncryptedSharedPreferences _sharedPreferences;

  SharedPreferences(this._sharedPreferences);

  // Firestore:---------------------------------------------------------------------
  Future<String> get user async {
    return await _sharedPreferences.getString(SharedPreferencesConstants.user);
  }

  Future<bool> saveUser(String value) async {
    return await _sharedPreferences.setString(SharedPreferencesConstants.user, value);
  }

}