import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

import '../customer_profile.dart';

class CustomerRegistrationResponse extends ApiResponse{
  final bool success;
  final String message;
  final CustomerProfile data;
  CustomerRegistrationResponse({
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

  factory CustomerRegistrationResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CustomerRegistrationResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] != null ? CustomerProfile.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerRegistrationResponse.fromJson(String source) => CustomerRegistrationResponse.fromMap(json.decode(source));

  @override
  String toString() => 'CustomerRegistrationResponse(success: $success, message: $message, data: $data)';
}

