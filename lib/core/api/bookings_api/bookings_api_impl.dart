import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:starter_project/core/api/api_utils/api_helper.dart';
import 'package:starter_project/core/api/api_utils/api_routes.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/bookings_api/bookings_api.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/api_response_variants/bookings_response.dart';
import 'package:starter_project/models/api_response_variants/complete_booking_response.dart';
import 'package:starter_project/models/api_response_variants/getbookings_response.dart';

import '../../../locator.dart';

class BookingsApiImpl implements BookingsApi {
  //API client
  var server = locator<API>();
  @override
  Future<BookingResponse> createBooking({
    List<String> serviceIds,
    String bookingDate,
    String salonId,
  }) async {
    // Map<String, String> header = {
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json',
    //   'x-access-token': locator<UserInfoCache>().token
    // };

    Map val = {
      'serviceIds': serviceIds,
      'bookingDate': bookingDate,
    };
    print(jsonEncode(val));

    var responsebody = await server.post(
      '${ApiRoutes.createBooking}/$salonId/${locator<UserInfoCache>().customer.data.id}',
      header,
      jsonEncode(val),
    );

    BookingResponse response = BookingResponse.fromJson(responsebody);
    return response;
  }

  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'x-access-token': '${locator<UserInfoCache>().token}',
      };

  @override
  Future<AllBookingResponse> getCustomerUnCompletedBookings(
      {String customerId}) async {
    //String customerId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get(
          '${ApiRoutes.customerUncompletedOrders}/${locator<UserInfoCache>().customer.data.id}',
          header);
      AllBookingResponse res = AllBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<AllBookingResponse> getCustomerCompletedBookings({String customerId}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get(
          '${ApiRoutes.customerCompletedOrders}/${locator<UserInfoCache>().customer.data.id}',
          header);
      AllBookingResponse res = AllBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<AllBookingResponse> getSalonUnCompletedBookings({String salonId}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get(
          '${ApiRoutes.salonUncompletedOrders}/${locator<UserInfoCache>().salon.data.salon.id}',
          header);
      AllBookingResponse res = AllBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<AllBookingResponse> getSalonCompletedBookings({String salonId}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get(
          '${ApiRoutes.salonCompletedOrders}/${locator<UserInfoCache>().salon.data.salon.id}',
          header);
      AllBookingResponse res = AllBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<CompleteBookingResponse> completeCustomerBookings({String bookingID}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.put(
          '${ApiRoutes.customerCompleteOrders}/$bookingID',
          header);
      CompleteBookingResponse res = CompleteBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
   @override
  Future<CompleteBookingResponse> completeSalonBookings({String bookingID}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.put(
          '${ApiRoutes.salonCompleteOrders}/$bookingID',
          header);
      CompleteBookingResponse res = CompleteBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
 @override
  Future<CompleteBookingResponse> approveBookings({String bookingID}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.put(
          '${ApiRoutes.approveOrders}/$bookingID',
          header);
      CompleteBookingResponse res = CompleteBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

 @override
  Future<CompleteBookingResponse> rejectBookings({String bookingID}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.put(
          '${ApiRoutes.rejectOrders}/$bookingID',
          header);
      CompleteBookingResponse res = CompleteBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<AllBookingResponse> getUnapproveBookings({String salonId}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get(
          '${ApiRoutes.unApproveOrders}/${locator<UserInfoCache>().salon.data.salon.id}',
          header);
      AllBookingResponse res = AllBookingResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

}
