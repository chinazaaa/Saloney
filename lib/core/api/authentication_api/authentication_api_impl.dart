import 'dart:convert';
import 'dart:io';

import 'package:starter_project/models/api_response.dart';
import 'package:starter_project/models/api_response_variants/customer_login_response.dart';
import 'package:starter_project/models/api_response_variants/customer_registration_response.dart';
import 'package:starter_project/models/api_response_variants/resend_otp_response.dart';
import 'package:starter_project/models/api_response_variants/salon_login_response.dart';
import 'package:starter_project/models/api_response_variants/salon_registration_response.dart';

import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../api_utils/network_exceptions.dart';
import '../../../locator.dart';
import 'authentication_api.dart';

class AuthenticationApiImpl implements AuthenticationApi {

  //header
  static var header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  //API client
  var server = locator<API>();

  @override
  Future<CustomerLoginResponse> loginCustomer({String email, String password}) async{
    Map val = {
      'email': email,
      'password': password,
    };

    try {
      var responsebody =
          await server.post(ApiRoutes.loginCustomer, header, jsonEncode(val));
      CustomerLoginResponse response = CustomerLoginResponse.fromJson(responsebody);
      return response;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<SalonLoginResponse> loginSaloon({String email, String password}) async{
    Map val = {
      'email': email,
      'password': password,
    };

    try {
      var responsebody =
          await server.post(ApiRoutes.loginSalon, header, jsonEncode(val));
      SalonLoginResponse response = SalonLoginResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }

  }

  @override
  Future<CustomerRegistrationResponse> registerCustomer({String userName, String email, String phone, String password}) async{
    Map val =   {
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
    };

    try {
      var responsebody =
          await server.post(ApiRoutes.registerCustomer, header, jsonEncode(val));
      CustomerRegistrationResponse response = CustomerRegistrationResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }

    // return null; FIXME dead code
  }

  @override
  Future<SalonRegistrationResponse> registerSaloon({String userName, String email, String phone, String password, String nameOfSalon, String typeOfSalon, String address}) async{
    Map val =   {
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
      'nameOfSalon': nameOfSalon,
      'typeOfSalon': typeOfSalon,
      'address': address,
    };

    print(val);

    try {
      var responsebody =
          await server.post(ApiRoutes.registerSalon, header, jsonEncode(val));
      SalonRegistrationResponse response = SalonRegistrationResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }

    // return null; FIXME dead code
  }

  @override
  Future<ApiResponse> confirmCustomerOTP({String otp}) async{
    Map val =   {
      'otp' : otp
    };

    print(val);

    try {
      var responsebody =
          await server.post(ApiRoutes.confirmCustomerOTP, header, jsonEncode(val));
      CustomerRegistrationResponse response = CustomerRegistrationResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<SalonRegistrationResponse> confirmSaloonOTP({String otp}) async {
    Map val =   {
      'otp' : otp
    };

    print(val);

    try {
      var responsebody =
          await server.post(ApiRoutes.confirmSalonOTP, header, jsonEncode(val));
      SalonRegistrationResponse response = SalonRegistrationResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }
  }




  @override
  Future<ApiResponse> resendOTPSalon({String email}) async{
    Map val =   {
      'email': email
    };

    print(val);

    try {
      var responsebody =
          await server.post(ApiRoutes.resendSalonOTP, header, jsonEncode(val));
      ResendOTPResponse response = ResendOTPResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<ApiResponse> resendOTPCustomer({String email}) async{
    Map val =   {
      'email': email
    };

    print(val);

    try {
      var responsebody =
          await server.post(ApiRoutes.resendCustomerOTP, header, jsonEncode(val));
      ResendOTPResponse response = ResendOTPResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }
  }


  @override
  Future<ApiResponse> forgotPasswordSalon({String email}) async{
    Map val =   {
      'email': email
    };
     print(val);
   

    try {
      var responsebody =
          await server.post(ApiRoutes.forgotSalonPassword, header, jsonEncode(val));
      ResendOTPResponse response = ResendOTPResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }
  }


  @override
  Future<ApiResponse> forgotPasswordCustomer({String email}) async{
    Map val =   {
      'email': email
    };

    print(val);

    try {
      var responsebody =
          await server.post(ApiRoutes.forgotCustomerPassword, header, jsonEncode(val));
      ResendOTPResponse response = ResendOTPResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }
  }

}
