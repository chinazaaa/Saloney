// To parse this JSON data, do
//
//     final unpublishedServiceResponse = unpublishedServiceResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';
import 'package:starter_project/models/service/salon_service.dart';

class PublishedServiceResponse extends ApiResponse {
  PublishedServiceResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data);

  bool success;
  String message;
  List<SalonService> data;

  PublishedServiceResponse copyWith({
    bool success,
    String message,
    List<SalonService> data,
  }) =>
      PublishedServiceResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PublishedServiceResponse.fromJson(String str) =>
      PublishedServiceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PublishedServiceResponse.fromMap(Map<String, dynamic> json) =>
      PublishedServiceResponse(
        success: json["success"],
        message: json["message"],
        data: List<SalonService>.from(
            json["data"].map((x) => SalonService.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

// class PublishedService {
//   PublishedService({
//     this.isPublished,
//     this.id,
//     this.service,
//     this.description,
//     this.image,
//     this.category,
//     this.price,
//     this.salon,
//     this.cloudinaryId,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });

//   bool isPublished;
//   String id;
//   String service;
//   String description;
//   String image;
//   String category;
//   String price;
//   String salon;
//   String cloudinaryId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   PublishedService copyWith({
//     bool isPublished,
//     String id,
//     String service,
//     String description,
//     String image,
//     String category,
//     String price,
//     String salon,
//     String cloudinaryId,
//     DateTime createdAt,
//     DateTime updatedAt,
//     int v,
//   }) =>
//       PublishedService(
//         isPublished: isPublished ?? this.isPublished,
//         id: id ?? this.id,
//         service: service ?? this.service,
//         description: description ?? this.description,
//         image: image ?? this.image,
//         category: category ?? this.category,
//         price: price ?? this.price,
//         salon: salon ?? this.salon,
//         cloudinaryId: cloudinaryId ?? this.cloudinaryId,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         v: v ?? this.v,
//       );

//   factory PublishedService.fromJson(String str) => PublishedService.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory PublishedService.fromMap(Map<String, dynamic> json) => PublishedService(
//     isPublished: json["isPublished"],
//     id: json["_id"],
//     service: json["service"],
//     description: json["description"],
//     image: json["image"],
//     category: json["category"],
//     price: json["price"],
//     salon: json["salon"],
//     cloudinaryId: json["cloudinary_id"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );

//   Map<String, dynamic> toMap() => {
//     "isPublished": isPublished,
//     "_id": id,
//     "service": service,
//     "description": description,
//     "image": image,
//     "category": category,
//     "price": price,
//     "salon": salon,
//     "cloudinary_id": cloudinaryId,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "__v": v,
//   };
// }
