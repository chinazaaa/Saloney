import 'package:get_it/get_it.dart';

import 'core/api/api_utils/api_helper.dart';
import 'core/api/authentication_api/authentication_api.dart';
import 'core/api/authentication_api/authentication_api_impl.dart';
import 'infrastructure/user_info_cache.dart';


GetIt locator = GetIt.instance;

void setupLocator() {

  //Example
  // locator.registerLazySingleton<OverlayManager>(() => OverlayManager());

  //UI


  //Core
  locator.registerLazySingleton<API>(() => API());
  locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());
  locator
      .registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());

}
