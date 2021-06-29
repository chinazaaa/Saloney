// To parse this JSON data, do
//
//     final bookingsResponse = bookingsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';
// BookingsResponse bookingsResponseFromJson(String str) => BookingsResponse.fromJson(json.decode(str));

// String bookingsResponseToJson(BookingsResponse data) => json.encode(data.toJson());

class BookingsResponse extends ApiResponse{
    BookingsResponse({
        this.success,
        this.message,
        this.data,
    }): super(success: success, message: message, data: data);

    bool success;
    String message;
    Bookings data;
  factory BookingsResponse.fromJson(String str) => BookingsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
    factory BookingsResponse.fromMap(Map<String, dynamic> json) => BookingsResponse(
        success: json["success"],
        message: json["message"],
        data: Bookings.fromJson(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Bookings {
    Bookings({
        this.services,
        this.bookingDate,
        this.approved,
        this.completedByCustomer,
        this.completedBySalon,
        this.id,
        this.customer,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    List<String> services;
    String bookingDate;
    bool approved;
    bool completedByCustomer;
    bool completedBySalon;
    String id;
    String customer;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
        services: List<String>.from(json["services"].map((x) => x)),
        bookingDate: json["bookingDate"],
        approved: json["approved"],
        completedByCustomer: json["completedByCustomer"],
        completedBySalon: json["completedBySalon"],
        id: json["_id"],
        customer: json["customer"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x)),
        "bookingDate": bookingDate,
        "approved": approved,
        "completedByCustomer": completedByCustomer,
        "completedBySalon": completedBySalon,
        "_id": id,
        "customer": customer,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
