// To parse this JSON data, do
//
//     final customerLoginResponse = customerLoginResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

import '../customer.dart';

class CustomerLoginResponse extends ApiResponse{
  CustomerLoginResponse({
    this.success,
    this.message,
    this.data,
  }) : super(message: message, data: data, success: success);

  bool success;
  String message;
  Customer data;

  CustomerLoginResponse copyWith({
    bool success,
    String message,
    Customer data,
  }) =>
      CustomerLoginResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CustomerLoginResponse.fromJson(String str) => CustomerLoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerLoginResponse.fromMap(Map<String, dynamic> json) => CustomerLoginResponse(
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
