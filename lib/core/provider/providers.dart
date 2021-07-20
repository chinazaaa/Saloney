// FIXME Unused import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:starter_project/Salon/pages/screens/service_provider.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';
import 'package:starter_project/core/repositories/bookings_repository.dart';
import 'package:starter_project/core/repositories/cart_repository.dart';
import 'package:starter_project/core/repositories/customer_repository.dart';
import 'package:starter_project/core/repositories/dashboard_repository.dart';
import 'package:starter_project/core/repositories/notification_repository.dart';
import 'package:starter_project/core/repositories/profile_repositories.dart';
import 'package:starter_project/core/repositories/service_repository.dart';

class SaloneyProviders {
  //The providers for dependency injection and state management are to added here
  //as the app will use MultiProvider

  // FIXME New Code
  static final providers = <SingleChildWidget>[
    // FIXME the name SingleChildCloneableWIdget isn't a type

    // static final providers = <SingleChildCloneableWidget>[
    //format for registering providers:
    //ChangeNotifierProvider(create: (_) => SplashScreenModel()),
    /// UI Viewmodels

    /// Repositories
    ChangeNotifierProvider(create: (_) => AuthRepository()),
    ChangeNotifierProvider(create: (_) => ServiceProvider()),
    ChangeNotifierProvider(create: (_) => ServiceRepo()),
    ChangeNotifierProvider(create: (_) => ProfileRepo()),
    ChangeNotifierProvider(create: (_) => DashboardRepo()),
    ChangeNotifierProvider(create: (_) => BookingRepo()),
    ChangeNotifierProvider(create: (_) => CustomerToSalonRepository()),
    ChangeNotifierProvider(create: (_) => CustomerRepository()),
    ChangeNotifierProvider(create: (_) => CartRepository()),
    ChangeNotifierProvider(create: (_) => NotificationRepository()),
  ];
}
