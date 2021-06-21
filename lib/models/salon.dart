import 'dart:convert';

import 'api_response_variants/salon_login_response.dart';
class Salon {
  Salon({
    this.location,
    this.description,
    this.image,
    this.id,
    this.nameOfSalon,
    this.salonOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Location location;
  String description;
  String image;
  String id;
  String nameOfSalon;
  String salonOwner;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Salon copyWith({
    Location location,
    String description,
    String image,
    String id,
    String nameOfSalon,
    String salonOwner,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
  }) =>
      Salon(
        location: location ?? this.location,
        description: description ?? this.description,
        image: image ?? this.image,
        id: id ?? this.id,
        nameOfSalon: nameOfSalon ?? this.nameOfSalon,
        salonOwner: salonOwner ?? this.salonOwner,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Salon.fromJson(String str) => Salon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Salon.fromMap(Map<String, dynamic> json) => Salon(
    location: Location.fromMap(json["location"]),
    description: json["description"],
    image: json["image"],
    id: json["_id"],
    nameOfSalon: json["nameOfSalon"],
    salonOwner: json["salonOwner"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "location": location.toMap(),
    "description": description,
    "image": image,
    "_id": id,
    "nameOfSalon": nameOfSalon,
    "salonOwner": salonOwner,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}