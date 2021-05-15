// To parse this JSON data, do
//
//     final createServiceResponse = createServiceResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

class CreateServiceResponse extends ApiResponse{
  CreateServiceResponse({
    this.message,
    this.data,
    this.success,
  }) : super(message: message, data: data, success: success);

  String message;
  Data data;
  bool success;

  factory CreateServiceResponse.fromJson(String str) => CreateServiceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateServiceResponse.fromMap(Map<String, dynamic> json) => CreateServiceResponse(
    message: json["message"],
    data: Data.fromMap(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "data": data.toMap(),
    "success": success,
  };
}

class Data {
  Data({
    this.isPublished,
    this.imageUrl,
    this.id,
    this.service,
    this.description,
    this.category,
    this.price,
    this.salon,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool isPublished;
  String imageUrl;
  String id;
  String service;
  String description;
  String category;
  String price;
  String salon;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    isPublished: json["isPublished"],
    imageUrl: json["imageURL"],
    id: json["_id"],
    service: json["service"],
    description: json["description"],
    category: json["category"],
    price: json["price"],
    salon: json["salon"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "isPublished": isPublished,
    "imageURL": imageUrl,
    "_id": id,
    "service": service,
    "description": description,
    "category": category,
    "price": price,
    "salon": salon,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
