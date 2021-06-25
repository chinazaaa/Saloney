// To parse this JSON data, do
//
//     final getSalonByLocationResponse = getSalonByLocationResponseFromMap(jsonString);

import 'dart:convert';

import '../salon.dart';

class GetSalonByLocationResponse {
  GetSalonByLocationResponse({
    this.salonLocation,
  });

  List<Salon> salonLocation;

  GetSalonByLocationResponse copyWith({
    List<Salon> salonLocation,
  }) =>
      GetSalonByLocationResponse(
        salonLocation: salonLocation ?? this.salonLocation,
      );

  factory GetSalonByLocationResponse.fromJson(String str) => GetSalonByLocationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetSalonByLocationResponse.fromMap(Map<String, dynamic> json) => GetSalonByLocationResponse(
    salonLocation: List<Salon>.from(json["salonLocation"].map((x) => Salon.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "salonLocation": List<dynamic>.from(salonLocation.map((x) => x.toMap())),
  };
}
