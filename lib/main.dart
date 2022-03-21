//Created by Irra for HealthSafe's technical assessment
import 'dart:async';

import 'package:distance_run_tracker/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'di/components/setup_locator.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  return runZonedGuarded(() async {
    runApp(App());
  }, (error, stack) {
    if (kDebugMode) {
      print(stack);
      print(error);
    }
  });
}
