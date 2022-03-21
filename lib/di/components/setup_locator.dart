
import 'package:distance_run_tracker/store/login/login_store.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:get_it/get_it.dart';

import '../../data/local/shared_preferences.dart';
import '../../data/network/auth_repository.dart';
import '../../data/network/distance_repository.dart';
import '../../store/error/error_store.dart';
import '../../store/home/home_store.dart';
import '../modules/local_module.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<EncryptedSharedPreferences>(() => LocalModule.provideSharedPreferences());
  getIt.registerSingletonAsync<AuthRepository>(() => LocalModule.provideAuthRepo());
  getIt.registerSingletonAsync<DistanceRepository>(() => LocalModule.provideDistanceRepo());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(SharedPreferences(await getIt.getAsync<EncryptedSharedPreferences>()));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LoginStore(getIt<AuthRepository>()));
  getIt.registerSingleton(HomeStore(getIt<DistanceRepository>(), getIt<AuthRepository>()));
}