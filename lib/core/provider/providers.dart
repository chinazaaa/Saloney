import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';

class SaloneyProviders {
  //The providers for dependency injection and state management are to added here
  //as the app will use MultiProvider
  static final providers = <SingleChildCloneableWidget>[
    //format for registering providers:
    //ChangeNotifierProvider(create: (_) => SplashScreenModel()),
    /// UI Viewmodels


    /// Repositories
    ChangeNotifierProvider(create: (_) => AuthRepository()),


  ];
}
