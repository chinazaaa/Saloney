// To parse this JSON data, do
//
//     final allBookingResponse = allBookingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:starter_project/index.dart';

import '../booking.dart';

class AllBookingResponse extends ApiResponse{
  AllBookingResponse({
    this.success,
    this.message,
    this.data,
  }) : super(success: success, message: message, data: data);

  bool success;
  String message;
  List<Booking> data;

  AllBookingResponse copyWith({
    bool success,
    String message,
    List<Booking> data,
  }) =>
      AllBookingResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AllBookingResponse.fromJson(String str) => AllBookingResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllBookingResponse.fromMap(Map<String, dynamic> json) => AllBookingResponse(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Booking>.from(json["data"].map((x) => Booking.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
  };
}
