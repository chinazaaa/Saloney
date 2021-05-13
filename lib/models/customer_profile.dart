import 'dart:convert';
import 'image_class.dart';

class CustomerProfile {
  final Image image;
  final bool isEmailVerified;
  final bool isActive;
  final String userRole;
  final String id;
  final String email;
  final String password;
  final int phone;
  final String userName;
  final int otp;
  final String createdAt;
  final String updatedAt;
  final int v;
  CustomerProfile({
    this.image,
    this.isEmailVerified,
    this.isActive,
    this.userRole,
    this.id,
    this.email,
    this.password,
    this.phone,
    this.userName,
    this.otp,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image?.toMap(),
      'isEmailVerified': isEmailVerified,
      'isActive': isActive,
      'userRole': userRole,
      '_id': id,
      'email': email,
      'password': password,
      'phone': phone,
      'userName': userName,
      'otp': otp,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  factory CustomerProfile.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CustomerProfile(
      image: Image.fromMap(map['image']),
      isEmailVerified: map['isEmailVerified'],
      isActive: map['isActive'],
      userRole: map['userRole'],
      id: map['_id'],
      email: map['email'],
      password: map['password'],
      phone: map['phone']?.toInt(),
      userName: map['userName'],
      otp: map['otp']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerProfile.fromJson(String source) =>
      CustomerProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(image: $image, isEmailVerified: $isEmailVerified, isActive: $isActive, userRole: $userRole, _id: $id, email: $email, password: $password, phone: $phone, userName: $userName, otp: $otp, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }
}

// FIXME Reused therefore moved to a separte file
// class Image {
//   final String path;
//   Image({
//     this.path,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'path': path,
//     };
//   }

//   factory Image.fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;

//     return Image(
//       path: map['path'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

//   @override
//   String toString() => 'Image(path: $path)';
// }
