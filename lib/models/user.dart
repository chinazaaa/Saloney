import 'dart:convert';

class User {
  final Local local;
  final Image image;
  final String id;
  final String identifier;
  final String createdAt;
  final String updatedAt;
  final int v;
  User({
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

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
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

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

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
    );
  }

  String toJson() => json.encode(toMap());

  factory Local.fromJson(String source) => Local.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Local(firstName: $firstName, lastName: $lastName, isActive: $isActive, isEmailVerified: $isEmailVerified, userRole: $userRole, email: $email, password: $password, phone: $phone, userName: $userName, location: $location, nameOfSalon: $nameOfSalon, otp: $otp)';
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