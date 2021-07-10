import 'package:starter_project/index.dart';

abstract class BookingsApi {
  Future<ApiResponse> getCustomerUnCompletedBookings({String customerId});

  Future<ApiResponse> getCustomerCompletedBookings({String customerId});

  Future<ApiResponse> getSalonUnCompletedBookings({String salonId});
  Future<ApiResponse> getSalonCompletedBookings({String salonId});

    Future<ApiResponse> completeCustomerBookings({String bookingID});
     Future<ApiResponse> completeSalonBookings({String bookingID});


          Future<ApiResponse> approveBookings({String bookingID});
          Future<ApiResponse> rejectBookings({String bookingID});
           Future<ApiResponse> getUnapproveBookings({String salonId});
  Future<ApiResponse> createBooking({
    List<String> serviceIds,
    String bookingDate,
    String salonId
  });
}
