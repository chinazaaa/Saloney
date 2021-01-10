import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/screens/dashboard.dart';
import 'package:starter_project/Customer/pages/screens/home.dart';
import 'package:starter_project/Customer/pages/screens/profile.dart';

import '../../intro_page.dart';


class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  /// static const String splashScreen = '/splashScreen';
  /// USE LOWER CAMEL CASE TO NAME VARIABLES THAT ARE NOT CONSTANTS
  /// use customerLoginPage instead of CustomerLoginPage :|

  static const String introPage = 'introPage';
  static const String customerLoginPage = 'CustomerLoginPage';
  static const String customerOtpScreen = 'CustomerOtpScreen';
  static const String CustomerSignupPage = 'CustomerSignupPage';
  static const String CustomerForgotPage = 'CustomerForgotPage';
  static const String CustomerOtpPassword = 'CustomerOtpPassword';
  static const String CustomerResetPage = 'CustomerResetPage';
  static const String CustomerResetSuccess = 'CustomerResetSuccess';
  static const String CustomerChatListPageView = 'CustomerChatListPageView';
  static const String CustomerChatListViewItem = 'CustomerChatListViewItem';
  static const String CustomerChatPageView = 'CustomerChatPageView';
  static const String dashboard = 'Dashboard';
  static const String home = 'Home';
  static const String CustomerLoading = 'CustomerLoading';
  static const String CustomerNotifications = 'CustomerNotifications';
  static const String Orders = 'Orders';
  static const String OverViewPageme = 'OverViewPage';
  static const String customerProfile = 'CustomerProfile';
  static const String CustomerReceivedMessageWidget = 'CustomerReceivedMessageWidget';
  static const String ServiceDetails = 'ServiceDetails';
  static const String SalonsScreen = 'SalonsScreen';
  static const String CustomerSendedMessageWidget = 'CustomerSendedMessageWidget';



  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),
    introPage: (context) => IntroPage(),
    customerProfile: (context) => CustomerProfile(),
    home: (context) => Home(),
    dashboard: (context) => Dashboard(),
    //Oya continue

  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add your screen here as well as the transition you want
      case introPage:
        return MaterialPageRoute(builder: (context) => IntroPage());
      case customerProfile:
        return MaterialPageRoute(builder: (context) => CustomerProfile());
      case home:
        return MaterialPageRoute(builder: (context) => Home());
      case dashboard:
        return MaterialPageRoute(builder: (context) => Dashboard());
      //Oya continue.. use sense oooo...


      //Default Route is error route
      default:
        return CupertinoPageRoute(
            builder: (context) => errorView(settings.name));
    }
  }

  static Widget errorView(String name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
