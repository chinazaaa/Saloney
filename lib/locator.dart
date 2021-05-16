import 'package:get_it/get_it.dart';
import 'package:starter_project/index.dart';

import 'core/api/api_utils/api_helper.dart';
import 'core/api/authentication_api/authentication_api.dart';
import 'core/api/authentication_api/authentication_api_impl.dart';
import 'infrastructure/user_info_cache.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //Api
  locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());

  //UI


  //Core
  locator.registerLazySingleton<API>(() => API());
  locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());
  locator
      .registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());

}
