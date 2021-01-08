// import '../../data_models/api_response.dart';
// import '../../data_models/login_api_response.dart';
//
// abstract class AuthenticationApi {
//   //Fcm
//   Future<ApiResponse> updateFcmToken(String token);
//
//   //OTP functions
//   Future<ApiResponse> createOtp(String number);
//   Future<ApiResponse> resendOtp(String number);
//   Future<ApiResponse> verifyOtp({String otp, String phone});
//
//   //Registration
//   Future<ApiResponse> register({
//     String firstname,
//     String lastname,
//     String email,
//     String password,
//     String passwordConfirmation,
//     String usertype = 'passenger',
//     String phone,
//     String alternateEmail,
//     String referral,
//   });
//
//   Future<LoginApiResponse> login({
//     String phone,
//     String deviceName,
//     String password,
//   });
//
//   Future<ApiResponse> logout(
//     String token,
//   );
//
//   Future<ApiResponse> forgotPassword(
//       String email,
//       );
//
//   Future<ApiResponse> resetPassword(
//       String password,
//       String password_confirmation,
//       String token
//       );
// }
