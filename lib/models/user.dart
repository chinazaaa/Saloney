import 'dart:convert';

class User {
  User({
    this.local,
    this.avatar,
    this.id,
    this.identifier,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Local local;
  String avatar;
  String id;
  String identifier;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  User copyWith({
    Local local,
    String avatar,
    String id,
    String identifier,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
  }) =>
      User(
        local: local ?? this.local,
        avatar: avatar ?? this.avatar,
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
    avatar: json["avatar"],
    id: json["_id"],
    identifier: json["identifier"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "local": local.toMap(),
    "avatar": avatar,
    "_id": id,
    "identifier": identifier,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}


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
