// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// //-- How to use --
// /* var userInfoCache = locator<UserInfoCache>();
//   await userInfoCache.getUserDataFromStorage();
//   print('used data: ${userInfoCache.name}');
// */
//
// ///This class is used to sync User Data
// class UserInfoCache {
//   //Objects used to set data
//   LoginResponse _loginResponse;
//   User _user;
//   Profile _profile;
//
//   //getters
//   User get user => _user;
//   Profile get profile => _profile;
//
//   //--token
//   String get token => this._loginResponse.token;
//   bool get isLoggedIn => this._user != null;
//   int get id => this._user.id;
//
//   UserInfoCache() {
//     try {
//       //On initiate, attempt to populate fields from Local Storage
//       getUserDataFromStorage();
//     } catch (e) {
//       print(
//           'Could not find any data in shared Preference Location: \'user_data\'');
//     }
//   }
//
//   getUserDataFromStorage() async {
//     try {
//       //Instance of SharedPreferences
//       SharedPreferences storage = await SharedPreferences.getInstance();
//       var data = await storage.getString('user_data');
//
//       var buffer = jsonDecode(data);
//
//       // print(buffer);
//       //Set object fields
//       LoginResponse res = LoginResponse.fromJson(buffer);
//
//       this._user = res.user;
//       this._loginResponse = res;
//       this._profile = this.user.profile;
//
//       print('${res.user.name}\'s data fetched from Storage successfully');
//     } catch (e) {
//       print('There is no data in location: \'user_data\'');
//     }
//   }
//
//   Future<bool> cacheLoginResponse(LoginResponse response) async {
//     try {
//       //Instance of SharedPreferences
//       SharedPreferences storage = await SharedPreferences.getInstance();
//       //Sets value in storage labelled ['user_data']
//       bool val = await storage.setString('user_data', jsonEncode(response));
//
//       //set new values in class field
//       this._loginResponse = response;
//       this._user = response.user;
//       this._profile = response.user.profile;
//
//       print('${this.user.name}\'s data cached successfully');
//
//       return val;
//     } catch (e) {
//       print(
//           'An error occured while trying to cache Login Response of details: ${jsonEncode(response)}');
//       return false;
//     }
//   }
//
//   Future<bool> updateUserData(User userdata) async {
//     try {
//       //Instance of SharedPreferences
//       SharedPreferences storage = await SharedPreferences.getInstance();
//       LoginResponse newUserData =
//           LoginResponse(token: this.token, user: userdata);
//
//       //Update field in UserInfoCache
//       this._loginResponse = newUserData;
//       this._user = newUserData.user;
//       this._profile = userdata.profile;
//
//       //Sets new data in storage labelled ['user_data']
//       bool val = await storage.setString('user_data', jsonEncode(newUserData));
//
//       print('data in storage & app updated with ${this.user.name}\'s details');
//       return val;
//     } catch (e) {
//       print('UserInfoCache: Failed to update User Data');
//       return false;
//     }
//   }
//
//   clearCache() async {
//     SharedPreferences storage = await SharedPreferences.getInstance();
//     await storage.remove('user_data');
//
//     _loginResponse = null;
//     _user = null;
//     _profile = null;
//   }
//
// }
