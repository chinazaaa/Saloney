import 'dart:convert';

import '../api_response.dart';
// import '../customer_info.dart';
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
  final bool isActive;
  final bool isEmailVerified;
  final String userRole;
  final String email;
  final String password;
  final int phone;
  final String userName;
  final int otp;
  final String apiToken;
  final Image image;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;
  Data({
    this.isActive,
    this.isEmailVerified,
    this.userRole,
    this.email,
    this.password,
    this.phone,
    this.userName,
    this.otp,
    this.apiToken,
    this.image,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image?.toMap(),
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'isActive': isActive,
      'isEmailVerified': isEmailVerified,
      'userRole': userRole,
      'email': email,
      'password': password,
      'phone': phone,
      'userName': userName,
      'otp': otp,
      'api_token': apiToken,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      image: Image.fromMap(map['image']),
      id: map['_id'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
      isActive: map['isActive'],
      isEmailVerified: map['isEmailVerified'],
      userRole: map['userRole'],
      email: map['email'],
      password: map['password'],
      phone: map['phone']?.toInt(),
      userName: map['userName'],
      otp: map['otp']?.toInt(),
      apiToken: map['api_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data( isActive: $isActive, isEmailVerified: $isEmailVerified, userRole: $userRole, email: $email, password: $password, phone: $phone, userName: $userName, otp: $otp, api_token: $apiToken, image: $image, _id: $id,  createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }
}
