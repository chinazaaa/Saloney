import 'dart:convert';
class Service {
  Service({
    this.isPublished,
    this.id,
    this.service,
    this.description,
    this.image,
    this.category,
    this.price,
    this.salon,
    this.cloudinaryId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool isPublished;
  String id;
  String service;
  String description;
  String image;
  String category;
  String price;
  String salon;
  String cloudinaryId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Service copyWith({
    bool isPublished,
    String id,
    String service,
    String description,
    String image,
    String category,
    String price,
    String salon,
    String cloudinaryId,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
  }) =>
      Service(
        isPublished: isPublished ?? this.isPublished,
        id: id ?? this.id,
        service: service ?? this.service,
        description: description ?? this.description,
        image: image ?? this.image,
        category: category ?? this.category,
        price: price ?? this.price,
        salon: salon ?? this.salon,
        cloudinaryId: cloudinaryId ?? this.cloudinaryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Service.fromJson(String str) => Service.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Service.fromMap(Map<String, dynamic> json) => Service(
    isPublished: json["isPublished"],
    id: json["_id"],
    service: json["service"],
    description: json["description"],
    image: json["image"],
    category: json["category"],
    price: json["price"],
    salon: json["salon"],
    cloudinaryId: json["cloudinary_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "isPublished": isPublished,
    "_id": id,
    "service": service,
    "description": description,
    "image": image,
    "category": category,
    "price": price,
    "salon": salon,
    "cloudinary_id": cloudinaryId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}