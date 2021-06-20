import 'dart:convert';

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




