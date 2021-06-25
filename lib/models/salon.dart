import 'dart:convert';

import 'api_response_variants/salon_login_response.dart';
class Salon {
    Salon({
        this.location,
        this.description,
        this.image,
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
    List<GalleryItem> image;
    String id;
     String avatar;
    String category;
    String nameOfSalon;
    String salonOwner;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Salon copyWith({
        Location location,
        String description,
        List<GalleryItem> image,
        String id,
         String avatar,
        String nameOfSalon,
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
            salonOwner: salonOwner ?? this.salonOwner,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
            category: category ?? this.category
        );

    factory Salon.fromJson(String str) => Salon.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Salon.fromMap(Map<String, dynamic> json) => Salon(
        location: Location.fromMap(json["location"]),
        description: json["description"],
        image: List<GalleryItem>.from(json["image"].map((x) => GalleryItem.fromMap(x))),
        id: json["_id"],
        avatar: json["avatar"],
        nameOfSalon: json["nameOfSalon"],
        salonOwner: json["salonOwner"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        category: json["category"],
    );

    Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x.toMap())),
        "_id": id,
        "avatar": avatar,
        "category" : category,
        "nameOfSalon": nameOfSalon,
        "salonOwner": salonOwner,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
