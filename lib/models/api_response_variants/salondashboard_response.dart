    import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

class SalonDashboardResponse extends ApiResponse{
  SalonDashboardResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data);

  bool success;
  String message;
  DashboardInfo data;

  SalonDashboardResponse copyWith({
    bool success,
    String message,
    DashboardInfo data,
  }) =>
      SalonDashboardResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SalonDashboardResponse.fromJson(String str) => SalonDashboardResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SalonDashboardResponse.fromMap(Map<String, dynamic> json) => SalonDashboardResponse(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : DashboardInfo.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toMap(),
  };
}

class DashboardInfo {
  DashboardInfo({
    this.allCustomers,
    this.allOrders,
    this.publishedServices,
    this.unpublishedServices,
  });

  int allCustomers;
  int allOrders;
  int publishedServices;
  int unpublishedServices;

  DashboardInfo copyWith({
    int allCustomers,
    int allOrders,
    int publishedServices,
    int unpublishedServices,
  }) =>
      DashboardInfo(
        allCustomers: allCustomers ?? this.allCustomers,
        allOrders: allOrders ?? this.allOrders,
        publishedServices: publishedServices ?? this.publishedServices,
        unpublishedServices: unpublishedServices ?? this.unpublishedServices,
      );

  factory DashboardInfo.fromJson(String str) => DashboardInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DashboardInfo.fromMap(Map<String, dynamic> json) => DashboardInfo(
    allCustomers: json["all-customers"] == null ? null : json["all-customers"],
    allOrders: json["all-orders"] == null ? null : json["all-orders"],
    publishedServices: json["published-services"] == null ? null : json["published-services"],
    unpublishedServices: json["unpublished-services"] == null ? null : json["unpublished-services"],
  );

  Map<String, dynamic> toMap() => {
    "all-customers": allCustomers == null ? null : allCustomers,
    "all-orders": allOrders == null ? null : allOrders,
    "published-services": publishedServices == null ? null : publishedServices,
    "unpublished-services": unpublishedServices == null ? null : unpublishedServices,
  };
}