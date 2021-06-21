import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:starter_project/models/api_response_variants/salon_login_response.dart';
import 'package:starter_project/models/api_response_variants/update_customer_response.dart';
import 'package:starter_project/models/api_response_variants/update_salon_owner_response.dart';
import 'package:starter_project/models/api_response_variants/update_salon_response.dart';

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
  Future<ApiResponse> changeSalonOwnerPassword(
      {String token,
      String currentPassword,
      String password,
      String passwordConfirmation}) async {
    Map val = {
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': password,
    };

      var responsebody = await server.put(
        '${ApiRoutes.changeSalonOwnerPassword}/${locator<UserInfoCache>().salon.data.user.id}',
        header,
        body: jsonEncode(val),);

    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }


  @override
  Future<ApiResponse> changeCustomerPassword(
      {String token,
      String currentPassword,
      String password,
      String passwordConfirmation}) async {
    Map val = {
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': password,
    };

   var responsebody = await server.put(
        '${ApiRoutes.changeCustomerPassword}/${locator<UserInfoCache>().customer.data.id}',
        header,
        body: jsonEncode(val));

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
  Future<UpdateSalonResponse> updateSalonProfile(
      {String nameOfSalon,
      String description,
      File image,
      String category,
      String address}) async {
    Map<String, String> header = {
    'Accept': 'application/json',
   'Content-Type': 'application/json',
    'x-access-token': locator<UserInfoCache>().token
    };

    print('${locator<UserInfoCache>().salon.data.salon.id}');
    Map val = {
      'nameOfSalon': nameOfSalon,
      'description': description,
      'image': image,
      'category': category,
      'address': address,
    };

    var responsebody = await server.put(
        '${ApiRoutes.updateSalonProfile}/${locator<UserInfoCache>().salon.data.salon.id}',
        header,
        body: jsonEncode(val),);

    UpdateSalonResponse response = UpdateSalonResponse.fromJson(responsebody);
    return response;
  }

//update salon owner profile
  @override
  Future<UpdateSalonOwnerResponse> updateSalonUserProfile({String userName, String phone}) async {
    Map<String, String> val = {
      // 'email' : email,
      'phone': phone,
      'userName': userName,
    };

    var responsebody = await server.put(
        '${ApiRoutes.updateSalonOwnerProfile}/${locator<UserInfoCache>().salon.data.user.id}',
        header,
        body: jsonEncode(val));
    UpdateSalonOwnerResponse response = UpdateSalonOwnerResponse.fromJson(responsebody);
    return response;
  }

  //update customer
    @override
  Future<UpdateCustomerResponse> updateCustomerProfile({String userName, String phone}) async {
    Map<String, String> val = {
      // 'email' : email,
      'phone': phone,
      'userName': userName,
    };

    var responsebody = await server.put(
        '${ApiRoutes.updateCustomerProfile}/${locator<UserInfoCache>().customer.data.id}',
        header,
        body: jsonEncode(val));
    UpdateCustomerResponse response = UpdateCustomerResponse.fromJson(responsebody);
    return response;
  }


  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'x-access-token': locator<UserInfoCache>().token
      };
}
