// To parse this JSON data, do
//


import 'dart:convert';

import 'package:starter_project/index.dart';

import '../customer.dart';

class UpdateCustomerResponse extends ApiResponse{
  UpdateCustomerResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data);

  bool success;
  String message;
  Customer data;

  UpdateCustomerResponse copyWith({
    bool success,
    String message,
    Customer data,
  }) =>
      UpdateCustomerResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UpdateCustomerResponse.fromJson(String str) => UpdateCustomerResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateCustomerResponse.fromMap(Map<String, dynamic> json) => UpdateCustomerResponse(
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
