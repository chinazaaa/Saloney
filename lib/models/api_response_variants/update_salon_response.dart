// To parse this JSON data, do
//
//     final updateSalonOwnerResponse = updateSalonOwnerResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';
import 'package:starter_project/models/salon.dart';

class UpdateSalonResponse extends ApiResponse{
  UpdateSalonResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data);

  bool success;
  String message;
  Salon data;

  UpdateSalonResponse copyWith({
    bool success,
    String message,
    Salon data,
  }) =>
      UpdateSalonResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UpdateSalonResponse.fromJson(String str) => UpdateSalonResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateSalonResponse.fromMap(Map<String, dynamic> json) => UpdateSalonResponse(
    success: json["success"],
    message: json["message"],
    data: Salon.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data.toMap(),
  };
  
}
class Location {
  Location({
    this.type,
    this.coordinates,
    this.formattedAddress,
  });

  String type;
  List<double> coordinates;
  String formattedAddress;

  Location copyWith({
    String type,
    List<double> coordinates,
    String formattedAddress,
  }) =>
      Location(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
        formattedAddress: formattedAddress ?? this.formattedAddress,
      );

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    formattedAddress: json["formattedAddress"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    "formattedAddress": formattedAddress,
  };
}
