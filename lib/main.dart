import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_project/pages/intro_page.dart';
import 'package:starter_project/pages/size_config.dart';
//  const MaterialColor primaryColor = MaterialColor(0xfff3236e,{});

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set default display Orientation to Potrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroPage(),
    );
  }
}
