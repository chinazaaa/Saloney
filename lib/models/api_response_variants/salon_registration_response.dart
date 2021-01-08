import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

import '../saloonInfo.dart';


class SalonRegistrationResponse extends ApiResponse{
  final bool success;
  final String message;
  final SaloonInfo data;
  SalonRegistrationResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data, status: null);

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory SalonRegistrationResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SalonRegistrationResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] != null ? SaloonInfo.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalonRegistrationResponse.fromJson(String source) => SalonRegistrationResponse.fromMap(json.decode(source));

  @override
  String toString() => 'RegistrationResponse(success: $success, message: $message, data: $data)';
}

