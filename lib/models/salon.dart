import 'dart:convert';

import 'api_response_variants/salon_login_response.dart';

class Salon {
  Salon({
    this.location,
    this.description,
    this.image,
    this.phone,
    this.avatar,
    this.id,
    this.nameOfSalon,
    this.salonOwner,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.v,
  });

  Location location;
  String description;
  List<String> image;
  String id;
  String avatar;
  String category;
  String nameOfSalon;
  int phone;
  String salonOwner;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Salon copyWith({
    Location location,
    String description,
    List<String> image,
    String id,
    String avatar,
    String nameOfSalon,
    int phone,
    String salonOwner,
    String category,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
  }) =>
      Salon(
          location: location ?? this.location,
          description: description ?? this.description,
          image: image ?? this.image,
          id: id ?? this.id,
          avatar: avatar ?? this.avatar,
          nameOfSalon: nameOfSalon ?? this.nameOfSalon,
          phone: phone ?? this.phone,
          salonOwner: salonOwner ?? this.salonOwner,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          v: v ?? this.v,
          category: category ?? this.category);

  factory Salon.fromJson(String str) => Salon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Salon.fromMap(Map<String, dynamic> json) => Salon(
        location: Location.fromMap(json["location"]),
        description: json["description"],
        //image: json["image"] == null ? null : List<GalleryItem>.from(json["image"].map((x) => GalleryItem.fromMap(x))),
        // image: json["image"] == null ? null : json["image"],
        image: parseimage(json),
        // json["image"],
        // as List), //List<String>.from(json["image"].map((x) => x)),
        id: json["_id"],
        avatar: json["avatar"],
        nameOfSalon: json["nameOfSalon"],
          phone: json["phone"],
        salonOwner: json["salonOwner"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        category: json["category"],
      );

  static List<String> parseimage(Map<String, dynamic> json) {
    List<String> list = [];
    (json["image"] as List).forEach((element) {
      list.add(element);
    });
    return list;
  }

  Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "description": description,
        // "image": List<dynamic>.from(image.map((x) => x.toMap())),
        "image": List<String>.from(image.map((x) => x)),
        //"image": image,
        "_id": id,
        "avatar": avatar,
        "category": category,
        "nameOfSalon": nameOfSalon,
         "phone": phone,
        "salonOwner": salonOwner,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
