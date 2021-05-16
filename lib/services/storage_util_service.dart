// // FIXME clean this up later
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:starter_project/index.dart';
//
// // Service to store authentication tokens
// class StorageUtil {
//   static StorageUtil _storageUtil;
//   SharedPreferences _preferences;
//   FlutterSecureStorage _securedStorage;
//
//   static Future<StorageUtil> getInstance() async {
//     if (_storageUtil == null) {
//       StorageUtil placeholder = StorageUtil._();
//       await placeholder.init();
//       _storageUtil = placeholder;
//     }
//     return _storageUtil;
//   }
//
//   StorageUtil._();
//
//   Future<void> init() async {
//     if (_preferences == null) {
//       _preferences = await SharedPreferences.getInstance();
//     }
//     if (_securedStorage == null) {
//       _securedStorage = FlutterSecureStorage();
//     }
//   }
//
//   // Secured data storage for tokens
//   Future<void> saveToken(String key, String value) async {
//     await _securedStorage.write(key: key, value: value);
//   }
//
//   Future<String> readToken(String key) async {
//     return await _securedStorage.read(key: key);
//   }
//
//   Future<void> clearToken(String key) async {
//     await _securedStorage.delete(key: key);
//   }
//
//   // Local Data Storage
//   Future<void> saveString(String key, String value) async {
//     await _preferences.setString(key, value);
//   }
//
//   Future<void> saveInt(String key, int value) async {
//     await _preferences.setInt(key, value);
//   }
//
//   Future<void> saveDouble(String key, double value) async {
//     await _preferences.setDouble(key, value);
//   }
//
//   Future<void> saveBool(String key, bool value) async {
//     await _preferences.setBool(key, value);
//   }
//
//   Future<void> saveStringList(String key, List<String> value) async {
//     await _preferences.setStringList(key, value);
//   }
//
//   String readString(String key, {String def}) {
//     return _preferences.getString(key) ?? def;
//   }
//
//   int readInt(String key, {int def}) {
//     return _preferences.getInt(key) ?? def;
//   }
//
//   double readDouble(String key, {double def}) {
//     return _preferences.getDouble(key) ?? def;
//   }
//
//   bool readBool(String key, {bool def}) {
//     return _preferences.getBool(key) ?? def;
//   }
//
//   List<String> readStringList(String key, {List<String> def}) {
//     return _preferences.getStringList(key) ?? def;
//   }
//
//   Future<void> clearData(String key) async {
//     if (_preferences.containsKey(key)) {
//       await _preferences.remove(key);
//     }
//   }
// }
