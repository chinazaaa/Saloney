// To parse this JSON data, do
//
//     final createServiceResponse = createServiceResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';
import 'package:starter_project/models/service/service_info.dart';

class ServiceResponse extends ApiResponse{
  ServiceResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data);

  bool success;
  String message;
  Service data;

  ServiceResponse copyWith({
    bool success,
    String message,
    Service data,
  }) =>
      ServiceResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ServiceResponse.fromJson(String str) => ServiceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceResponse.fromMap(Map<String, dynamic> json) => ServiceResponse(
    success: json["success"],
    message: json["message"],
    data: Service.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data.toMap(),
  };
}
