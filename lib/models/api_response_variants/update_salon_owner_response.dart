// To parse this JSON data, do
//
//     final updateSalonOwnerResponse = updateSalonOwnerResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

import '../user.dart';

class UpdateSalonOwnerResponse extends ApiResponse{
  UpdateSalonOwnerResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data);

  bool success;
  String message;
  User data;

  UpdateSalonOwnerResponse copyWith({
    bool success,
    String message,
    User data,
  }) =>
      UpdateSalonOwnerResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UpdateSalonOwnerResponse.fromJson(String str) => UpdateSalonOwnerResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateSalonOwnerResponse.fromMap(Map<String, dynamic> json) => UpdateSalonOwnerResponse(
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
