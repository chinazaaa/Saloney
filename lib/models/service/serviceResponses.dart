import 'dart:convert';

import '../api_response.dart';

import 'service_info.dart';

//FIXME This endpoint returns slightly different data
class CreateServiceResponse extends ApiResponse {
  final bool success;
  final String message;
  final Data data;
  final String status;

  CreateServiceResponse({this.success, this.message, this.data, this.status})
      : super(status: status, success: success, message: message, data: data);

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'status': status,
      'data': data?.toMap(),
    };
  }

  factory CreateServiceResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CreateServiceResponse(
      success: map['success'],
      message: map['message'],
      status: map['status'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateServiceResponse.fromJson(String source) =>
      CreateServiceResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'Service(success: $success, status: $status, message: $message, data: $data)';
}

class Data {
  final Service service;
  Data({this.service});

  Map<String, dynamic> toMap() {
    return {'service': service?.toMap()};
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(service: Service.fromMap(map['service']));
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return "Data(service : $service)";
  }
}
