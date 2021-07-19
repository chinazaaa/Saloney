// To parse this JSON data, do
//
//     final bookingResponse = bookingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/models/api_response.dart';

import '../booking.dart';

class CompleteBookingResponse extends ApiResponse{
    CompleteBookingResponse({
       this.success,
        this.message,
        this.booking,
    }) : super(message: message,  success: success, data: booking);

    bool success;
    String message;
    Booking booking;

    CompleteBookingResponse copyWith({
        bool success,
        String message,
        Booking booking,
    }) => 
        CompleteBookingResponse(
             success: success ?? this.success,
            message: message ?? this.message,
            booking: booking ?? this.booking,
        );

    factory CompleteBookingResponse.fromJson(String str) => CompleteBookingResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CompleteBookingResponse.fromMap(Map<String, dynamic> json) => CompleteBookingResponse(
         success: json["success"],
        message: json["message"],
        booking: json["booking"] == null ? null : Booking.fromMap(json["booking"]),
    );

    Map<String, dynamic> toMap() => {
         "success": success,
        "message": message,
        "booking": booking.toMap(),
    };
}
