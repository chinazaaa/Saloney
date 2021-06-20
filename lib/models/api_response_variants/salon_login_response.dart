// To parse this JSON data, do
//
//     final salonLoginResponse = salonLoginResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

import '../salon.dart';
import '../user.dart';

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
class Location {
  List<double> coordinates;
  String type;
  String formattedAddress;

  Location({this.coordinates, this.type, this.formattedAddress});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
    formattedAddress = json['formattedAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    data['formattedAddress'] = this.formattedAddress;
    return data;
  }
}
