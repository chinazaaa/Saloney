// To parse this JSON data, do
//
//     final customerLoginResponse = customerLoginResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

import '../customer.dart';

class CustomerRegistrationResponse extends ApiResponse{
  CustomerRegistrationResponse({
    this.success,
    this.message,
    this.data,
  }) : super(message: message, data: data, success: success);

  bool success;
  String message;
  Customer data;

  CustomerRegistrationResponse copyWith({
    bool success,
    String message,
    Customer data,
  }) =>
      CustomerRegistrationResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CustomerRegistrationResponse.fromJson(String str) => CustomerRegistrationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerRegistrationResponse.fromMap(Map<String, dynamic> json) => CustomerRegistrationResponse(
    success: json["success"],
    message: json["message"],
    data: Customer.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data.toMap(),
  };
}