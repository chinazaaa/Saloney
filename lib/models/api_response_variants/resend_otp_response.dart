// To parse this JSON data, do
//
//     final customerLoginResponse = customerLoginResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';


class ResendOTPResponse extends ApiResponse{
   ResendOTPResponse({
    this.success,
    this.message,
    
  }) : super(message: message,  success: success);

  bool success;
  String message;
  // Customer data;

   ResendOTPResponse copyWith({
    bool success,
    String message,
   // Customer data,
  }) =>
       ResendOTPResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        //data: data ?? this.data,
      );

  factory  ResendOTPResponse.fromJson(String str) => ResendOTPResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResendOTPResponse.fromMap(Map<String, dynamic> json) => ResendOTPResponse(
    success: json["success"],
    message: json["message"],
   // data: Customer.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    //"data": data.toMap(),
  };
}