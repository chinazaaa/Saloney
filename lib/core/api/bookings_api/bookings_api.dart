import 'package:starter_project/index.dart';

abstract class BookingsApi {
   Future<ApiResponse> getCustomerUnCompletedBookings({
    String customerId
  });
}
