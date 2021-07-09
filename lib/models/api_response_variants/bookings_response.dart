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
        this.serviceName,
        this.servicePrice,
        this.bookingDate,
        this.approved,
        this.completedByCustomer,
        this.completedBySalon,
        this.id,
        this.customer,
        this.customerName,
        this.customerPhone,
        this.salon,
        this.salonName,
        this.salonPhone,
        this.bookingId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    List<String> services;
    String serviceName;
    String servicePrice;
    String bookingDate;
    bool approved;
    bool completedByCustomer;
    bool completedBySalon;
    String id;
    String customer;
    String customerName;
    int customerPhone;
    String salon;
    String salonName;
    int salonPhone;
    String bookingId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Booking copyWith({
        List<String> services,
        String serviceName,
        String servicePrice,
        String bookingDate,
        bool approved,
        bool completedByCustomer,
        bool completedBySalon,
        String id,
        String customer,
         String customerName,
        int customerPhone,
        String salon,
         String salonName,
         int salonPhone,
        String bookingId,
        DateTime createdAt,
        DateTime updatedAt,
        int v,
    }) => 
        Booking(
            services: services ?? this.services,
            serviceName: serviceName ?? this.serviceName,
            servicePrice: servicePrice ?? this.servicePrice,
            bookingDate: bookingDate ?? this.bookingDate,
            approved: approved ?? this.approved,
            completedByCustomer: completedByCustomer ?? this.completedByCustomer,
            completedBySalon: completedBySalon ?? this.completedBySalon,
            id: id ?? this.id,
            customer: customer ?? this.customer,
             customerName: customerName ?? this.customerName,
              customerPhone: customerPhone ?? this.customerPhone,
            salon: salon ?? this.salon,
              salonName: salonName ?? this.salonName,
                salonPhone: salonPhone ?? this.salonPhone,
            bookingId: bookingId ?? this.bookingId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory Booking.fromJson(String str) => Booking.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Booking.fromMap(Map<String, dynamic> json) => Booking(
        services: List<String>.from(json["services"].map((x) => x)),
         serviceName: json["serviceName"],
          servicePrice: json["servicePrice"],
        bookingDate: json["bookingDate"],
        approved: json["approved"],
        completedByCustomer: json["completedByCustomer"],
        completedBySalon: json["completedBySalon"],
        id: json["_id"],
        customer: json["customer"],
        customerName: json["customerName"],
        customerPhone: json["customerPhone"],
        salon: json["salon"],
        salonName: json["salonName"],
        salonPhone: json["salonPhone"],
        bookingId: json["bookingID"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "services": List<dynamic>.from(services.map((x) => x)),
        "serviceName": serviceName,
        "servicePrice": servicePrice,
        "bookingDate": bookingDate,
        "approved": approved,
        "completedByCustomer": completedByCustomer,
        "completedBySalon": completedBySalon,
        "_id": id,
        "customer": customer,
        "customerName": customerName,
        "customerPhone": customerPhone,
        "salon": salon,
        "salonName": salonName,
        "salonPhone": salonPhone,
        "bookingID": bookingId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}