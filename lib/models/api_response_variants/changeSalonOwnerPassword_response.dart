// To parse this JSON data, do
//
//     final customerLoginResponse = customerLoginResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

import '../user.dart';

class ChangeSalonOwnerPasswordResponse extends ApiResponse{
  ChangeSalonOwnerPasswordResponse({
    this.success,
    this.message,
    this.data,
  }) : super(message: message, data: data, success: success);

  bool success;
  String message;
  User data;

  ChangeSalonOwnerPasswordResponse copyWith({
    bool success,
    String message,
    User data,
  }) =>
      ChangeSalonOwnerPasswordResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ChangeSalonOwnerPasswordResponse.fromJson(String str) => ChangeSalonOwnerPasswordResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChangeSalonOwnerPasswordResponse.fromMap(Map<String, dynamic> json) => ChangeSalonOwnerPasswordResponse(
    success: json["success"],
    message: json["message"],
    data: User.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data.toMap(),
  };
}
