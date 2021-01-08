import 'dart:convert';
import 'dart:io';

import 'package:starter_project/models/api_response.dart';

import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../api_utils/network_exceptions.dart';
import '../../utils/ui_exceptions.dart';

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
  Future<ApiResponse> loginCustomer({String userName, String password}) async{
    Map val = {
      'userName': userName,
      'password': password,
    };

    try {
      var responsebody =
          await server.post(ApiRoutes.loginSalon, header, jsonEncode(val));
      ApiResponse response = ApiResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<ApiResponse> loginSaloon({String userName, String password}) async{
    Map val = {
      'userName': userName,
      'password': password,
    };

    try {
      var responsebody =
          await server.post(ApiRoutes.loginSalon, header, jsonEncode(val));
      ApiResponse response = ApiResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }

  }

  @override
  Future<ApiResponse> registerCustomer({String userName, String email, String phone, String password}) async{
    Map val =   {
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
    };

    try {
      var responsebody =
          await server.post(ApiRoutes.registerCustomer, header, jsonEncode(val));
      ApiResponse response = ApiResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }

    return null;
  }

  @override
  Future<ApiResponse> registerSaloon({String userName, String email, String phone, String password, String nameOfSalon, String typeOfSalon, String location}) async{
    Map val =   {
      'userName': userName,
      'email': email,
      'phone': phone,
      'password': password,
      'nameOfSalon': nameOfSalon,
      'typeOfSalon': typeOfSalon,
      'location': location,
    };

    print(val);

    try {
      var responsebody =
          await server.post(ApiRoutes.registerSalon, header, jsonEncode(val));
      ApiResponse response = ApiResponse.fromJson(responsebody);

      return response;
    } on SocketException {
      throw NetworkException();
    }

    return null;
  }

}
