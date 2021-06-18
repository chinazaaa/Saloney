
import 'dart:convert';
import '../../index.dart';

class GetunPublishedServiceResponse extends ApiResponse{
  bool success;
  String message;
  List<Data> data;

  GetunPublishedServiceResponse({this.success, this.message, this.data});

  GetunPublishedServiceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool isPublished;
  String imageURL;
  String sId;
  String service;
  String description;
  String category;
  String price;
  String salon;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.isPublished,
      this.imageURL,
      this.sId,
      this.service,
      this.description,
      this.category,
      this.price,
      this.salon,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    isPublished = json['isPublished'];
    imageURL = json['imageURL'];
    sId = json['_id'];
    service = json['service'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    salon = json['salon'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPublished'] = this.isPublished;
    data['imageURL'] = this.imageURL;
    data['_id'] = this.sId;
    data['service'] = this.service;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    data['salon'] = this.salon;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
