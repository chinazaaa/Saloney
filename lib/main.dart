import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'core/provider/providers.dart';
import 'core/routes/route_names.dart';
import 'locator.dart';
import 'ui_helpers/themes/app_theme_light.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Register services
  setupLocator();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set default display Orientation to Potrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
       statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    
    ));
    return MultiProvider(
      providers: SaloneyProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Saloney',
        theme: appThemeLight,
        routes: RouteNames.routes,
        // home: SalonLoginPage(),
        initialRoute: RouteNames.introPage,
        navigatorKey: Get.key,
      ),
    );
  }
}
