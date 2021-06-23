// To parse this JSON data, do
//
//     final getSalonByLocationResponse = getSalonByLocationResponseFromMap(jsonString);

import 'dart:convert';

class GetSalonByLocationResponse {
  GetSalonByLocationResponse({
    this.salonLocation,
  });

  List<SalonLocation> salonLocation;

  GetSalonByLocationResponse copyWith({
    List<SalonLocation> salonLocation,
  }) =>
      GetSalonByLocationResponse(
        salonLocation: salonLocation ?? this.salonLocation,
      );

  factory GetSalonByLocationResponse.fromJson(String str) => GetSalonByLocationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetSalonByLocationResponse.fromMap(Map<String, dynamic> json) => GetSalonByLocationResponse(
    salonLocation: List<SalonLocation>.from(json["salonLocation"].map((x) => SalonLocation.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "salonLocation": List<dynamic>.from(salonLocation.map((x) => x.toMap())),
  };
}

class SalonLocation {
  SalonLocation({
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
  List<dynamic> image;
  String id;
  String nameOfSalon;
  String salonOwner;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  SalonLocation copyWith({
    Location location,
    String description,
    List<dynamic> image,
    String id,
    String nameOfSalon,
    String salonOwner,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
  }) =>
      SalonLocation(
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

  factory SalonLocation.fromJson(String str) => SalonLocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SalonLocation.fromMap(Map<String, dynamic> json) => SalonLocation(
    location: Location.fromMap(json["location"]),
    description: json["description"],
    image: List<dynamic>.from(json["image"].map((x) => x)),
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
    "image": List<dynamic>.from(image.map((x) => x)),
    "_id": id,
    "nameOfSalon": nameOfSalon,
    "salonOwner": salonOwner,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
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
