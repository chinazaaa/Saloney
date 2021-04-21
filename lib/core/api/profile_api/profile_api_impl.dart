// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:passenger_app/core/data_models/api_response_variants/profile_response.dart';
//
// import '../api_utils/api_helper.dart';
// import '../api_utils/api_routes.dart';
// import '../api_utils/network_exceptions.dart';
// import '../api_utils/response_handler.dart';
// import 'profile_api.dart';
// import '../../data_models/api_response.dart';
// import '../../../infrastructure/user_info_cache.dart';
//
// import '../../../locator.dart';
//
// class ProfileApiImpl implements ProfileApi {
//   //API client
//   var server = locator<API>();
//
//   @override
//   Future<ApiResponse> changePassword(
//       {String token,
//       String currentPassword,
//       String password,
//       String passwordConfirmation}) async {
//     String token = locator<UserInfoCache>().token;
//
//     //header
//     var header = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//
//     Map val = {
//       'current_password': currentPassword,
//       'password': password,
//       'password_confirmation': password,
//     };
//
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.changePassword, header, jsonEncode(val));
//
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//       return response;
//     } on SocketException {
//       throw NetworkException();
//     }
//   }
//
//   @override
//   Future<ProfileResponse> getUserProfile({String token}) async {
//     String token = locator<UserInfoCache>().token;
//
//     //header
//     var header = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//
//     try {
//       var responsebody = await server.get(ApiRoutes.profile, header);
//
//       ProfileResponse response = ProfileResponse.fromJson(responsebody);
//
//       return response;
//     } on SocketException {
//       throw NetworkException();
//     }
//   }
//
//   @override
//   Future<ApiResponse> updateProfile(
//       {String token,
//       @required String firstname,
//       @required String lastname,
//       @required String email,
//       @required String phone,
//       String photo}) async {
//     String token = locator<UserInfoCache>().token;
//
//     //header
//     var header = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//
//     //header for Dio request
//     var profileHeader = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//
//     //If there is a profile photo, perform Dio Request
//     if (photo != null) {
//       String imgname = DateTime.now()
//           .millisecondsSinceEpoch
//           .toString(); //Used to get unique name for image
//       Dio dio = Dio();
//       FormData formdata = FormData.fromMap({
//         "firstname": firstname,
//         "lastname": lastname,
//         "email": email,
//         'phone': phone,
//         "photo": await MultipartFile.fromFile(
//           photo,
//           filename: '$imgname/$photo',
//           contentType: MediaType('image', 'jpg'),
//         ),
//       });
//
//       try {
//         Response res = await dio.post(
//           ApiRoutes.updateProfile,
//           data: formdata,
//           options: Options(
//             method: 'POST',
//             contentType: "application/json",
//             headers: profileHeader,
//             responseType: ResponseType.plain,
//           ),
//           // onSendProgress: (int sent, int total) {
//           //   print("Sent - $sent , Total : $total");
//           // },
//         );
//
//         ApiResponse response = ApiResponse.fromJson(res.data);
//         return response;
//       } on SocketException {
//         throw NetworkException();
//       }
//     }
//
//     //If no profile image was added, perform normal HTTP request
//     else {
//       //data
//       Map val = {
//         'firstname': firstname,
//         'lastname': lastname,
//         'email': email,
//         'phone': phone,
//       };
//
//       //http Request
//       try {
//         var responsebody =
//             await server.post(ApiRoutes.updateProfile, header, jsonEncode(val));
//
//         ApiResponse response = ApiResponse.fromJson(responsebody);
//         return response;
//       } on SocketException {
//         throw NetworkException();
//       }
//     }
//   }
//
//   @override
//   Future<ProfileResponse> getProfile({String token}) async {
//     //header
//     var header = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer ${locator<UserInfoCache>().token}'
//     };
//
//     try {
//       var responsebody =
//       await server.get(ApiRoutes.profile, header);
//       ProfileResponse response = ProfileResponse.fromJson(responsebody);
//       return response;
//     } on SocketException {
//       throw NetworkException();
//     }
//     return null;
//   }
//
//   @override
//   Future<ApiResponse> togglePushNotification({int value}) async{
//     //data
//     Map val = {
//       'push_notification': value.toString(),
//     };
//
//     var header = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer ${locator<UserInfoCache>().token}'
//     };
//
//     //http Request
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.togglePushNotification, header, jsonEncode(val));
//
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//       return response;
//     } on SocketException {
//       throw NetworkException();
//     }
//   }
// }
