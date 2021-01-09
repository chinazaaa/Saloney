import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

class SalonLoginResponse extends ApiResponse{
  final bool success;
  final String message;
  final Salon data;
  final String status;
  SalonLoginResponse({
    this.success,
    this.message,
    this.data,
    this.status,
  }) : super(status: status, success: success, message: message, data: data);

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
      'status': status,
    };
  }

  factory SalonLoginResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SalonLoginResponse(
      success: map['success'],
      message: map['message'],
      status: map['status'],
      data: Salon.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SalonLoginResponse.fromJson(String source) => SalonLoginResponse.fromMap(json.decode(source));

  @override
  String toString() => 'SalonLoginResponse(success: $success, status: $status, message: $message, data: $data)';
}

class Salon {
  final Local local;
  final Image image;
  final String id;
  final String identifier;
  final String createdAt;
  final String updatedAt;
  final int v;
  Salon({
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

  factory Salon.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Salon(
      local: Local.fromMap(map['local']),
      image: Image.fromMap(map['image']),
      id: map['_id'],
      identifier: map['identifier'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Salon.fromJson(String source) => Salon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(local: $local, image: $image, _id: $id, identifier: $identifier, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }
}

class Local {
  final String firstName;
  final String lastName;
  final bool isActive;
  final bool isEmailVerified;
  final String userRole;
  final String email;
  final String password;
  final int phone;
  final String userName;
  final String location;
  final String nameOfSalon;
  final int otp;
  final String api_token;
  Local({
    this.firstName,
    this.lastName,
    this.isActive,
    this.isEmailVerified,
    this.userRole,
    this.email,
    this.password,
    this.phone,
    this.userName,
    this.location,
    this.nameOfSalon,
    this.otp,
    this.api_token,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'isActive': isActive,
      'isEmailVerified': isEmailVerified,
      'userRole': userRole,
      'email': email,
      'password': password,
      'phone': phone,
      'userName': userName,
      'location': location,
      'nameOfSalon': nameOfSalon,
      'otp': otp,
      'api_token': api_token,
    };
  }

  factory Local.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Local(
      firstName: map['firstName'],
      lastName: map['lastName'],
      isActive: map['isActive'],
      isEmailVerified: map['isEmailVerified'],
      userRole: map['userRole'],
      email: map['email'],
      password: map['password'],
      phone: map['phone']?.toInt(),
      userName: map['userName'],
      location: map['location'],
      nameOfSalon: map['nameOfSalon'],
      otp: map['otp']?.toInt(),
      api_token: map['api_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Local.fromJson(String source) => Local.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Local(firstName: $firstName, lastName: $lastName, isActive: $isActive, isEmailVerified: $isEmailVerified, userRole: $userRole, email: $email, password: $password, phone: $phone, userName: $userName, location: $location, nameOfSalon: $nameOfSalon, otp: $otp, api_token: $api_token)';
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