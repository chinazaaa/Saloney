import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:starter_project/core/api/api_utils/api_helper.dart';
import 'package:starter_project/core/api/api_utils/api_routes.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/bookings_api/bookings_api.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/api_response_variants/bookings_response.dart';

import '../../../locator.dart';

class BookingsApiImpl implements BookingsApi {

  //API client
  var server = locator<API>();


  Map<String, String> get header => {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'x-access-token': '${locator<UserInfoCache>().token}',
  };
  
  @override
  Future<ApiResponse> getCustomerUnCompletedBookings({String customerId}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get('${ApiRoutes.customerUncompletedOrders}/$customerId', header);
      BookingsResponse res =
          BookingsResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
    @override
  Future<ApiResponse> getCustomerCompletedBookings({String customerId}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get('${ApiRoutes.customerCompletedOrders}/$customerId', header);
      BookingsResponse res =
          BookingsResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
    @override
  Future<ApiResponse> getSalonUnCompletedBookings({String customerId}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get('${ApiRoutes.salonUncompletedOrders}/$customerId', header);
      BookingsResponse res =
          BookingsResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
    @override
  Future<ApiResponse> getSalonCompletedBookings({String customerId}) async {
    //String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody = await server.get('${ApiRoutes.salonCompletedOrders}/$customerId', header);
      BookingsResponse res =
          BookingsResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
}
