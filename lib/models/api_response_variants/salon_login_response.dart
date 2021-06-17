// To parse this JSON data, do
//
//     final salonLoginResponse = salonLoginResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

class SalonLoginResponse extends ApiResponse{
  SalonLoginResponse({
    this.success,
    this.message,
    this.data,
  }) : super(message: message, success: success, data: data);

  bool success;
  String message;
  SalonData data;

  SalonLoginResponse copyWith({
    bool success,
    String message,
    SalonData data,
  }) =>
      SalonLoginResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SalonLoginResponse.fromJson(String str) => SalonLoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SalonLoginResponse.fromMap(Map<String, dynamic> json) => SalonLoginResponse(
    success: json["success"],
    message: json["message"],
    data: SalonData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data.toMap(),
  };
}

class SalonData {
  SalonData({
    this.user,
    this.salon,
  });

  User user;
  Salon salon;

  SalonData copyWith({
    User user,
    Salon salon,
  }) =>
      SalonData(
        user: user ?? this.user,
        salon: salon ?? this.salon,
      );

  factory SalonData.fromJson(String str) => SalonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SalonData.fromMap(Map<String, dynamic> json) => SalonData(
    user: User.fromMap(json["user"]),
    salon: Salon.fromMap(json["salon"]),
  );

  Map<String, dynamic> toMap() => {
    "user": user.toMap(),
    "salon": salon.toMap(),
  };
}

class Salon {
  Salon({
    this.description,
    this.image,
    this.id,
    this.nameOfSalon,
    this.location,
    this.salonOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String description;
  String image;
  String id;
  String nameOfSalon;
  String location;
  String salonOwner;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Salon copyWith({
    String description,
    String image,
    String id,
    String nameOfSalon,
    String location,
    String salonOwner,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
  }) =>
      Salon(
        description: description ?? this.description,
        image: image ?? this.image,
        id: id ?? this.id,
        nameOfSalon: nameOfSalon ?? this.nameOfSalon,
        location: location ?? this.location,
        salonOwner: salonOwner ?? this.salonOwner,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Salon.fromJson(String str) => Salon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Salon.fromMap(Map<String, dynamic> json) => Salon(
    description: json["description"],
    image: json["image"],
    id: json["_id"],
    nameOfSalon: json["nameOfSalon"],
    location: json["location"],
    salonOwner: json["salonOwner"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "description": description,
    "image": image,
    "_id": id,
    "nameOfSalon": nameOfSalon,
    "location": location,
    "salonOwner": salonOwner,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class User {
  User({
    this.local,
    this.image,
    this.id,
    this.identifier,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Local local;
  Image image;
  String id;
  String identifier;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  User copyWith({
    Local local,
    Image image,
    String id,
    String identifier,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
  }) =>
      User(
        local: local ?? this.local,
        image: image ?? this.image,
        id: id ?? this.id,
        identifier: identifier ?? this.identifier,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    local: Local.fromMap(json["local"]),
    image: json["image"],
    id: json["_id"],
    identifier: json["identifier"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "local": local.toMap(),
    "image": image,
    "_id": id,
    "identifier": identifier,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

// class Image {
//   Image({
//     this.path,
//   });

//   String path;

//   Image copyWith({
//     String path,
//   }) =>
//       Image(
//         path: path ?? this.path,
//       );

//   factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Image.fromMap(Map<String, dynamic> json) => Image(
//     path: json["path"],
//   );

//   Map<String, dynamic> toMap() => {
//     "path": path,
//   };
// }

class Local {
  Local({
    this.isActive,
    this.isEmailVerified,
    this.userRole,
    this.email,
    this.password,
    this.phone,
    this.userName,
    this.otp,
    this.apiToken,
  });

  bool isActive;
  bool isEmailVerified;
  String userRole;
  String email;
  String password;
  int phone;
  String userName;
  int otp;
  String apiToken;

  Local copyWith({
    bool isActive,
    bool isEmailVerified,
    String userRole,
    String email,
    String password,
    int phone,
    String userName,
    int otp,
    String apiToken,
  }) =>
      Local(
        isActive: isActive ?? this.isActive,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        userRole: userRole ?? this.userRole,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        userName: userName ?? this.userName,
        otp: otp ?? this.otp,
        apiToken: apiToken ?? this.apiToken,
      );

  factory Local.fromJson(String str) => Local.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Local.fromMap(Map<String, dynamic> json) => Local(
    isActive: json["isActive"],
    isEmailVerified: json["isEmailVerified"],
    userRole: json["userRole"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    userName: json["userName"],
    otp: json["otp"],
    apiToken: json["api_token"],
  );

  Map<String, dynamic> toMap() => {
    "isActive": isActive,
    "isEmailVerified": isEmailVerified,
    "userRole": userRole,
    "email": email,
    "password": password,
    "phone": phone,
    "userName": userName,
    "otp": otp,
    "api_token": apiToken,
  };
}
