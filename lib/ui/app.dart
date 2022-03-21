
import 'package:distance_run_tracker/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/network/auth_repository.dart';
import '../data/network/distance_repository.dart';
import '../di/components/setup_locator.dart';
import '../store/home/home_store.dart';
import '../store/login/login_store.dart';
import 'login/login_screen.dart';

class App extends StatelessWidget {
  final ThemeData themeDataDark = ThemeData(brightness: Brightness.dark);

  final LoginStore _loginStore = LoginStore(getIt<AuthRepository>());
  final HomeStore _distanceStore = HomeStore(getIt<DistanceRepository>(), getIt<AuthRepository>());

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<LoginStore>(create: (_) => _loginStore),
          Provider<HomeStore>(create: (_) => _distanceStore),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Distance Run Tracker',
          theme: themeDataDark,
          initialRoute: LoginScreen.id,
          routes: {
            LoginScreen.id: (context) => const LoginScreen(),
            HomeScreen.id: (context) => const HomeScreen(),
          },
        ));
  }
}
