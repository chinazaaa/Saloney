import 'package:flutter/material.dart';
import 'package:starter_project/Salon/pages/screens/utils/colors.dart';

class AppTextStyles {
  static const headerTextStyle = const TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w800,
    color: CustomColors.headerTextColor
  );

  static const subHeaderTextStyle = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
  );

  static const unselectedTabTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );

  static const selectedTabTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: CustomColors.primaryColor,
  );
}

class AvailableFonts {
  static const primaryFont = "Quicksand";
}

class AvailableImages {
  static const hamburger = 'assets/hamburger.png';
  static const assassin = 'assets/2.png';
  // static const bleach = 'assets/images/1.png';
  static const luffy = 'assets/account_success.png';
  static const mikasa = 'assets/customer.png';
  static const naruto = 'assets/reset_success.png';
  static const natsu = 'assets/salon.png';
}