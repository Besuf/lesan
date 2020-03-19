import 'package:get_it/get_it.dart';
import 'package:lesan/core/providers/home_model.dart';
import 'package:lesan/core/providers/auth_model.dart';
import 'package:lesan/core/services/api/api.dart';
import 'package:lesan/core/services/api/authentication_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => AuthModel());
  locator.registerFactory(() => HomeModel());
}