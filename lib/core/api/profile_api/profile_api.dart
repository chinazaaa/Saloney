import 'dart:async';
import 'dart:io';

import 'package:starter_project/index.dart';


abstract class ProfileApi {
  Future<ApiResponse> getUserProfile({String token});

  Future<ApiResponse> updateProfile(
      {String token,
      String firstname,
      String lastname,
      String email,
      String phone,
      String photo});

  Future<ApiResponse> changePassword(
      {String token,
      String currentPassword,
      String password,
      String passwordConfirmation});


  Future<ApiResponse> getProfile({String token,});

  Future<ApiResponse> togglePushNotification({int value});
}
