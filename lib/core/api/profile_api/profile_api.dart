import 'dart:async';
import 'dart:io';

import 'package:starter_project/index.dart';

abstract class ProfileApi {
  //Future<ApiResponse> getUserProfile({String token});

  Future<ApiResponse> updateSalonProfile({
    String nameOfSalon,
    String description,
    File image,
    String category,
    String location,
  });

  Future<ApiResponse> updateSalonUserProfile({
    String userName,
    // String email,
    String phone,
  });

  Future<ApiResponse> changePassword(
      {String token,
      String currentPassword,
      String password,
      String passwordConfirmation});

  Future<ApiResponse> getSalonOwnerProfile({
    String id,
  });
    Future<ApiResponse> getSalonProfile({
    String id,
  });
  Future<ApiResponse> getCustomerProfile({
    String id,
  });
  Future<ApiResponse> togglePushNotification({int value});
}
