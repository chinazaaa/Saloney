import 'dart:convert';

import '../api_response.dart';
import '../customer_info.dart';
import '../image_class.dart';

class CustomerLoginResponse extends ApiResponse {
  final bool success;
  final String message;
  final Data data;
  final String status;
  CustomerLoginResponse({
    this.success,
    this.message,
    this.data,
    this.status,
  }) : super(status: status, success: success, message: message, data: data);

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'status': status,
      'data': data?.toMap(),
    };
  }

  factory CustomerLoginResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CustomerLoginResponse(
      success: map['success'],
      message: map['message'],
      status: map['status'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerLoginResponse.fromJson(String source) =>
      CustomerLoginResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CustomerLoginResponse(success: $success, status: $status, message: $message, data: $data)';
}

class Data {
  final Customer local;
  final Image image;
  final String id;
  final String identifier;
  final String createdAt;
  final String updatedAt;
  final int v;
  Data({
    this.local,
    this.image,
    this.id,
    this.identifier,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Map<String, dynamic> toMap() {
    return {
      'local': local?.toMap(),
      'image': image?.toMap(),
      '_id': id,
      'identifier': identifier,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      local: Customer.fromMap(map['local']),
      image: Image.fromMap(map['image']),
      id: map['_id'],
      identifier: map['identifier'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(local: $local, image: $image, _id: $id, identifier: $identifier, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }
}
