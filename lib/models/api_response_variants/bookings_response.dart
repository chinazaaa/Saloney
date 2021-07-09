// To parse this JSON data, do
//
//     final bookingResponse = bookingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

import '../booking.dart';

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
        booking: json["booking"] == null ? null : Booking.fromMap(json["booking"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "booking": booking.toMap(),
    };
}
