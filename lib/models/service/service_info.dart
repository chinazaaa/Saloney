import 'dart:convert';
import '../image_class.dart';

class Service {
  final String id;
  final String salonId;

  final String serviceName;
  final String description;
  final String category;
  final String price; // FIXME String or Int??
  //FIXME
  final Image serviceImage;

  final String createdAt;
  final String updatedAt;

  final bool isPublished;
  final int v;

  Service(
      {this.id,
      this.salonId,
      this.serviceName,
      this.description,
      this.category,
      this.price,
      this.serviceImage,
      this.createdAt,
      this.updatedAt,
      this.isPublished,
      this.v});

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "salon": salonId,
      "service": serviceName,
      "description": description,
      "category": category,
      "price": price,
      "imageURL": serviceImage,
      "isPublished": isPublished,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      "__v": v
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Service(
        id: map['_id'],
        salonId: map["salon"],
        serviceName: map["service"],
        description: map["description"],
        category: map["category"],
        price: map["price"],
        serviceImage: Image.fromMap(map['imageURL']),
        isPublished: map["isPublished"],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        v: map['__v']?.toInt());
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data( _id: $id,salon: $salonId,service: $serviceName,description: $description,category: $category,price: $price,imageURL: $serviceImage,isPublished: $isPublished,createdAt: $createdAt,updatedAt: $updatedAt,__v: $v)';
  }
}
