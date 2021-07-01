// To parse this JSON data, do
//
//     final bookingResponse = bookingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

class BookingResponse extends ApiResponse{
    BookingResponse({
        this.message,
        this.booking,
    }) : super(message: message, data: booking);

    String message;
    Booking booking;

    BookingResponse copyWith({
        String message,
        Booking booking,
    }) => 
        BookingResponse(
            message: message ?? this.message,
            booking: booking ?? this.booking,
        );

    factory BookingResponse.fromJson(String str) => BookingResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BookingResponse.fromMap(Map<String, dynamic> json) => BookingResponse(
        message: json["message"],
        booking: Booking.fromMap(json["booking"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "booking": booking.toMap(),
    };
}

class Booking {
    Booking({
        this.services,
        this.bookingDate,
        this.approved,
        this.completedByCustomer,
        this.completedBySalon,
        this.id,
        this.customer,
        this.salon,
        this.bookingId,
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
    String salon;
    String bookingId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Booking copyWith({
        List<String> services,
        String bookingDate,
        bool approved,
        bool completedByCustomer,
        bool completedBySalon,
        String id,
        String customer,
        String salon,
        String bookingId,
        DateTime createdAt,
        DateTime updatedAt,
        int v,
    }) => 
        Booking(
            services: services ?? this.services,
            bookingDate: bookingDate ?? this.bookingDate,
            approved: approved ?? this.approved,
            completedByCustomer: completedByCustomer ?? this.completedByCustomer,
            completedBySalon: completedBySalon ?? this.completedBySalon,
            id: id ?? this.id,
            customer: customer ?? this.customer,
            salon: salon ?? this.salon,
            bookingId: bookingId ?? this.bookingId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory Booking.fromJson(String str) => Booking.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Booking.fromMap(Map<String, dynamic> json) => Booking(
        services: List<String>.from(json["services"].map((x) => x)),
        bookingDate: json["bookingDate"],
        approved: json["approved"],
        completedByCustomer: json["completedByCustomer"],
        completedBySalon: json["completedBySalon"],
        id: json["_id"],
        customer: json["customer"],
        salon: json["salon"],
        bookingId: json["bookingID"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "services": List<dynamic>.from(services.map((x) => x)),
        "bookingDate": bookingDate,
        "approved": approved,
        "completedByCustomer": completedByCustomer,
        "completedBySalon": completedBySalon,
        "_id": id,
        "customer": customer,
        "salon": salon,
        "bookingID": bookingId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}