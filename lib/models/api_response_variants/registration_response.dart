import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

import '../user.dart';

class RegistrationResponse extends ApiResponse{
  final bool success;
  final String message;
  final User data;
  RegistrationResponse({
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

  factory RegistrationResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RegistrationResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] != null ? User.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationResponse.fromJson(String source) => RegistrationResponse.fromMap(json.decode(source));

  @override
  String toString() => 'RegistrationResponse(success: $success, message: $message, data: $data)';
}

