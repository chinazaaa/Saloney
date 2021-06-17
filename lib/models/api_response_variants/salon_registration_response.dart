// To parse this JSON data, do
//
//     final salonRegistrationResponse = salonRegistrationResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

import '../saloonInfo.dart';

class SalonRegistrationResponse extends ApiResponse{
  SalonRegistrationResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data);

  bool success;
  String message;
  SaloonInfo data;

  SalonRegistrationResponse copyWith({
    bool success,
    String message,
    SaloonInfo data,
  }) =>
      SalonRegistrationResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SalonRegistrationResponse.fromJson(String str) => SalonRegistrationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SalonRegistrationResponse.fromMap(Map<String, dynamic> json) => SalonRegistrationResponse(
    success: json["success"],
    message: json["message"],
    data: SaloonInfo.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data.toMap(),
  };
}