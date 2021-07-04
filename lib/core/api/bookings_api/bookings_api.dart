import 'package:starter_project/index.dart';

abstract class BookingsApi {
  Future<ApiResponse> getCustomerUnCompletedBookings({String customerId});

  Future<ApiResponse> getCustomerCompletedBookings({String customerId});

  Future<ApiResponse> getSalonUnCompletedBookings({String customerId});
  Future<ApiResponse> getSalonCompletedBookings({String customerId});

  Future<ApiResponse> createBooking({
    List<String> serviceIds,
    String bookingDate,
    String salonId
  });
}