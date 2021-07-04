import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

class SalonDashboardResponse extends ApiResponse {
  bool success;
  String message;
  Data data;

  SalonDashboardResponse({this.success, this.message, this.data});

  factory SalonDashboardResponse.fromJson(String str) =>
      SalonDashboardResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  factory SalonDashboardResponse.fromMap(Map<String, dynamic> json) => SalonDashboardResponse(
        success: json['success'],
        message: json['message'],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        // final Map<String, dynamic> data = new Map<String, dynamic>();
        'success': success,
        'message': message,
        'data': data.toMap()
        //return data;
      };
}

class Data {
  int allCustomers;
  int allOrders;
  int publishedServices;
  int unpublishedServices;

  Data(
      {this.allCustomers,
      this.allOrders,
      this.publishedServices,
      this.unpublishedServices});
  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        allCustomers: json['all-customers'],
        allOrders: json['all-orders'],
        publishedServices: json['published-services'],
        unpublishedServices: json['unpublished-services'],
      );

  Map<String, dynamic> toMap() => {
        // final Map<String, dynamic> data = new Map<String, dynamic>();
        'all-customers': this.allCustomers,
        'all-orders': this.allOrders,
        'published-services': this.publishedServices,
        'unpublished-services': this.unpublishedServices,
      };
}
