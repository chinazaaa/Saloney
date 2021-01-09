import 'package:flutter/material.dart';

ThemeData appThemeLight = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  backgroundColor: Color(0xffF7F9FC),
  scaffoldBackgroundColor: Color(0xffF7F9FC),
  hintColor: Color(0xff9E9E9E),
  primaryColor: Colors.blue,
  primaryColorLight: Color(0xffffffff),
  accentColor: Colors.purple,
  primaryColorDark: Color(0xff000000),
  splashColor: Color(0xff222B45),
  textTheme: TextTheme(),
  fontFamily: 'DMSans',
  primaryTextTheme: TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xff222B45)),
    headline2: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff222B45)),
    headline3: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xff222B45)),
    subtitle1: TextStyle(fontSize: 14, color: Color(0xff222B45)),
  ),
);
