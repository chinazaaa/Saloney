import 'dart:convert';

class Customer {
  Customer({
    this.avatar,
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
    this.apiToken,
  });

  String avatar;
  bool isEmailVerified;
  bool isActive;
  String userRole;
  String id;
  String email;
  String password;
  int phone;
  String userName;
  int otp;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String apiToken;

  Customer copyWith({
    String avatar,
    bool isEmailVerified,
    bool isActive,
    String userRole,
    String id,
    String email,
    String password,
    int phone,
    String userName,
    int otp,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
    String apiToken,
  }) =>
      Customer(
        avatar: avatar ?? this.avatar,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        isActive: isActive ?? this.isActive,
        userRole: userRole ?? this.userRole,
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        userName: userName ?? this.userName,
        otp: otp ?? this.otp,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        apiToken: apiToken ?? this.apiToken,
      );

  factory Customer.fromJson(String str) => Customer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
    avatar: json["avatar"],
    isEmailVerified: json["isEmailVerified"],
    isActive: json["isActive"],
    userRole: json["userRole"],
    id: json["_id"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    userName: json["userName"],
    otp: json["otp"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    apiToken: json["api_token"],
  );

  Map<String, dynamic> toMap() => {
    "avatar": avatar,
    "isEmailVerified": isEmailVerified,
    "isActive": isActive,
    "userRole": userRole,
    "_id": id,
    "email": email,
    "password": password,
    "phone": phone,
    "userName": userName,
    "otp": otp,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "api_token": apiToken,
  };
}