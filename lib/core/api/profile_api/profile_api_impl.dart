import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

import '../../../index.dart';
import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../api_utils/network_exceptions.dart';
import 'profile_api.dart';
import '../../../infrastructure/user_info_cache.dart';

import '../../../locator.dart';

class ProfileApiImpl implements ProfileApi {
  //API client
  var server = locator<API>();

  @override
  Future<ApiResponse> changePassword(
      {String token,
      String currentPassword,
      String password,
      String passwordConfirmation}) async {
    Map val = {
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': password,
    };

    var responsebody =
        await server.post(ApiRoutes.changePassword, header, jsonEncode(val));

    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> getSalonOwnerProfile({String id}) async {
    var responsebody =
        await server.get(ApiRoutes.getSalonOwnerProfile + '$id', header);
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> getSalonProfile({String id}) async {
    var responsebody =
        await server.get(ApiRoutes.getSalonProfile + '$id', header);
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> getCustomerProfile({String id}) async {
    var responsebody = await server.get(ApiRoutes.getCustomerProfile, header);
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> togglePushNotification({int value}) async {
    //data
    Map val = {
      'push_notification': value.toString(),
    };

    var responsebody = await server.post(
        ApiRoutes.togglePushNotification, header, jsonEncode(val));

    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

//update salon profile
  @override
  Future<ApiResponse> updateSalonProfile(
      {String nameOfSalon,
      String description,
      File image,
      String category,
      String location}) async {
    Map val = {
      'nameOfSalon': nameOfSalon,
      'description': description,
      'image': image,
      'category': category,
      'location': location,
    };

    var responsebody = await server.put(
        '${ApiRoutes.updateSalonProfile}/${locator<UserInfoCache>().salon.data.salon.id}',
        header,
        body: jsonEncode(val),
        includesFiles: true);

    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

//update salon owner profile
  @override
  Future<ApiResponse> updateSalonOwnerProfile({String userName, String phone}) async {
    Map val = {
      // 'email' : email,
      'phone': phone,
      'userName': userName,
    };
  //  String url =
  //       ('${ApiRoutes.updateSalonOwnerProfile}/${locator<UserInfoCache>().salon.data.user.id}');
  //   print(url);
    var responsebody = await server.put(
        '${ApiRoutes.updateSalonOwnerProfile}/${locator<UserInfoCache>().salon.data.user.id}',
        header,
        body: jsonEncode(val));
    // await server.put(ApiRoutes.updateSalonOwnerProfile +'/60be7cf955227a3bb482888d', header, body:jsonEncode(val));
 
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${locator<UserInfoCache>().token}'
      };
}
