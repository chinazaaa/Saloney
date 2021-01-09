import 'dart:convert';

class ApiResponse {
  final bool success;
  final String message;
  final String status;
  final dynamic data;
  ApiResponse({
    this.success,
    this.message,
    this.status,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data,
      'status': status,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ApiResponse(
      success: map['success'],
      message: map['message'],
      status: map['status'],
      data: map['data']?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'ApiResponse(success: $success, message: $message, data: $data, status: $status)';
}
