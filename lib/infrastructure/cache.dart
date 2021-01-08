import 'package:shared_preferences/shared_preferences.dart';

class FCMCache {
  ///FCM Cache
  static const String location = "FCM";
  static setFcmToken(String fcmToken) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    bool val = await storage.setString(location, fcmToken);
    print("FCM token successfully cached");
    return val;
  }

  static Future<String> getFcmToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String token = storage.getString(location);
    return token;
  }

  static clearFcmToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove(location);
    print("FCM token cleared!");
  }

  static setLoggedOutVal(bool val) async{
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setBool('loggedOut', val);

  }

  static Future<bool> getLoggedOutVal() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    bool val = storage.getBool('loggedOut');

    return val;
  }

}
