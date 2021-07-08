import 'package:get_it/get_it.dart';
import 'package:starter_project/core/api/bookings_api/bookings_api.dart';
import 'package:starter_project/core/api/bookings_api/bookings_api_impl.dart';
import 'package:starter_project/core/api/customer_api/customer_api.dart';
import 'package:starter_project/core/api/customer_api/customer_api_impl.dart';
import 'package:starter_project/core/api/dashboard_api/dashboard_api.dart';
import 'package:starter_project/core/api/dashboard_api/dashboard_api_impl.dart';
import 'package:starter_project/core/api/profile_api/profile_api.dart';
import 'package:starter_project/core/api/profile_api/profile_api_impl.dart';
import 'package:starter_project/core/services/map_service.dart';
import 'package:starter_project/index.dart';

import 'core/api/api_utils/api_helper.dart';
import 'core/api/authentication_api/authentication_api.dart';
import 'core/api/authentication_api/authentication_api_impl.dart';
import 'infrastructure/user_info_cache.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //Api
  locator.registerLazySingleton<ServicesApi>(() => ServicesApiImpl());

  //UI


  //Core
  locator.registerLazySingleton<API>(() => API());
  locator.registerLazySingleton<CustomerApi>(() => CustomerApiImpl());
  locator.registerLazySingleton<BookingsApi>(() => BookingsApiImpl());
  locator.registerLazySingleton<ProfileApi>(() => ProfileApiImpl());
  locator.registerLazySingleton<DashboardApi>(() => SalonDashboardImpl());
  locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());
  locator.registerLazySingleton<MapService>(() => MapService());
  locator
      .registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());

}
