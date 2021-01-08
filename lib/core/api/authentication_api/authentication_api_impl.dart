// import 'dart:convert';
// import 'dart:io';
//
// import 'package:passenger_app/infrastructure/user_info_cache.dart';
//
// import '../api_utils/api_helper.dart';
// import '../api_utils/api_routes.dart';
// import '../api_utils/network_exceptions.dart';
// import '../../data_models/api_response.dart';
// import '../../data_models/login_api_response.dart';
// import '../../utils/ui_exceptions.dart';
//
// import '../../../locator.dart';
// import 'authentication_api.dart';
//
// class AuthenticationApiImpl implements AuthenticationApi {
//   //header
//   static var header = {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json'
//   };
//
//   //API client
//   var server = locator<API>();
//
//   @override
//   Future<ApiResponse> createOtp(String number) async {
//     Map val = {'phone': number};
//
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.createOTP, header, jsonEncode(val));
//
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//       if (response.status == true)
//         return response;
//       else
//         throw OTPFailedException();
//     } on SocketException {
//       throw NetworkException();
//     }
//
//     return null;
//   }
//
//   @override
//   Future<LoginApiResponse> login(
//       {String phone, String deviceName, String password}) async {
//     Map val = {
//       'phone': phone,
//       'password': password,
//       'device_name': deviceName,
//     };
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.login, header, jsonEncode(val));
//
//       LoginApiResponse response = LoginApiResponse.fromJson(responsebody);
//       if (response.status == true)
//         return response;
//       else
//         throw LoginFailedException();
//     } on BadRequestException {
//       throw LoginFailedException();
//     } on SocketException {
//       throw NetworkException();
//     }
//
//     return null;
//   }
//
//   @override
//   Future<ApiResponse> register(
//       {String firstname,
//       String lastname,
//       String email,
//       String password,
//       String passwordConfirmation,
//       String usertype = 'passenger',
//       String phone,
//       String alternateEmail,
//       String referral}) async {
//
//     Map val = referral == null || referral == "" ? {
//       'firstname': firstname,
//       'lastname': lastname,
//       'email': email,
//       'password_confirmation': password,
//       'user_type': usertype,
//       'password': password,
//       'phone': phone,
//     } :
//     {
//       'firstname': firstname,
//       'lastname': lastname,
//       'email': email,
//       'password_confirmation': password,
//       'user_type': usertype,
//       'password': password,
//       'phone': phone,
//       'referral_code': referral
//       // 'alternateEmail': alternateEmail,
//     };
//
//     print(val);
//
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.register, header, jsonEncode(val));
//       print(responsebody.toString());
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//
//       if (response.status == true) return response;
//     } on RegistrationFailedException {
//       throw RegistrationFailedException();
//     } on SocketException {
//       throw NetworkException();
//     }
//
//     return null;
//   }
//
//   @override
//   Future<ApiResponse> resendOtp(String number) async {
//     Map val = {'phone': number};
//     try {
//       var responsebody = await server.post(
//         ApiRoutes.resendOTP,
//         header,
//         jsonEncode(val),
//       );
//
//       print('Service impL: $responsebody');
//
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//       if (response.status == true) {
//         return response;
//       } else {
//         throw OTPFailedException();
//       }
//     } on SocketException {
//       throw NetworkException();
//     }
//
//     return null;
//   }
//
//   @override
//   Future<ApiResponse> verifyOtp({String otp, String phone}) async {
//     var val = {'phone': phone, 'otp': otp};
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.verifyOTP, header, jsonEncode(val));
//
//       print(responsebody.toString());
//
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//       if (response.status == true)
//         return response;
//       else
//         throw IncorrectOTPException();
//     } on SocketException {
//       throw NetworkException();
//     }
//
//     return null;
//   }
//
//   @override
//   Future<ApiResponse> logout(String token) async {
//     //header
//     var logoutHeader = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.logout, logoutHeader, null);
//
//       print(responsebody.toString());
//
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//       return response;
//     } on SocketException {
//       throw NetworkException();
//     }
//     return null;
//   }
//
//   @override
//   Future<ApiResponse> updateFcmToken(String token) async {
//     //Fetch user token for header auth
//     String userToken = locator<UserInfoCache>().token;
//
//     //header
//     var mheader = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $userToken',
//     };
//
//     Map val = {'fcm_token': token};
//
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.updateFCM, mheader, jsonEncode(val));
//       return ApiResponse();
//     } on SocketException {
//       throw NetworkException();
//     }
//   }
//
//   @override
//   Future<ApiResponse> forgotPassword(String email) async {
//     //header
//     var mheader = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//     };
//
//     Map val = {'email': email};
//
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.forgotPass, mheader, jsonEncode(val));
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//       return response;
//     } on SocketException {
//       throw NetworkException();
//     }
//   }
//
//   @override
//   Future<ApiResponse> resetPassword(String password, String password_confirmation, String token) async {
//     //header
//     var mheader = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//     };
//
//     Map val = {
//       'password': password,
//       'password_confirmation' : password_confirmation,
//       'token' : token,
//     };
//
//     try {
//       var responsebody =
//           await server.post(ApiRoutes.resetPass, mheader, jsonEncode(val));
//       ApiResponse response = ApiResponse.fromJson(responsebody);
//       return response;
//     } on SocketException {
//       throw NetworkException();
//     }
//   }
// }
