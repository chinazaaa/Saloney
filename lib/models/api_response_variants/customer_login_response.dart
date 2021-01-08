import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

class CustomerLoginResponse extends ApiResponse{
  final bool success;
  final String message;
  final Customer data;
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
      data: Customer.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerLoginResponse.fromJson(String source) => CustomerLoginResponse.fromMap(json.decode(source));

  @override
  String toString() => 'CustomerLoginResponse(success: $success, message: $message, data: $data, status: $status)';
}

class Customer {
  final Image image;
  final String firstName;
  final String lastName;
  final bool isEmailVerified;
  final bool isActive;
  final String userRole;
  final String id;
  final int phone;
  final String userName;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String api_token;
  Customer({
    this.image,
    this.firstName,
    this.lastName,
    this.isEmailVerified,
    this.isActive,
    this.userRole,
    this.id,
    this.phone,
    this.userName,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.api_token,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image?.toMap(),
      'firstName': firstName,
      'lastName': lastName,
      'isEmailVerified': isEmailVerified,
      'isActive': isActive,
      'userRole': userRole,
      '_id': id,
      'phone': phone,
      'userName': userName,
      'email': email,
      'password': password,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'api_token': api_token,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Customer(
      image: Image.fromMap(map['image']),
      firstName: map['firstName'],
      lastName: map['lastName'],
      isEmailVerified: map['isEmailVerified'],
      isActive: map['isActive'],
      userRole: map['userRole'],
      id: map['_id'],
      phone: map['phone']?.toInt(),
      userName: map['userName'],
      email: map['email'],
      password: map['password'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
      api_token: map['api_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(image: $image, firstName: $firstName, lastName: $lastName, isEmailVerified: $isEmailVerified, isActive: $isActive, userRole: $userRole, _id: $id, phone: $phone, userName: $userName, email: $email, password: $password, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v, api_token: $api_token)';
  }
}

class Image {
  final String path;
  Image({
    this.path,
  });

  Map<String, dynamic> toMap() {
    return {
      'path': path,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Image(
      path: map['path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() => 'Image(path: $path)';
}