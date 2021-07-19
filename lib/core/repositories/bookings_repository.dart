//import 'package:starter_project/Salon/pages/screens/published_service.dart';
import 'package:starter_project/core/api/bookings_api/bookings_api.dart';
import 'package:starter_project/index.dart';
//import 'package:starter_project/models/api_response_variants/bookings_response.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/models/api_response_variants/getbookings_response.dart';
import 'package:starter_project/models/booking.dart';

import '../../locator.dart';

class BookingRepo extends BaseNotifier {
  // API
  final _api = locator<BookingsApi>();

  List<Booking> salonUncompletedOrders = [];
  Future<bool> getSalonUnCompletedBookings({bool silently = false}) async {
    if (!silently) {
      if (salonUncompletedOrders.isEmpty) setState(ViewState.Busy);
    }
    AllBookingResponse resp;
    try {
      resp = await _api.getSalonUnCompletedBookings();
      if (resp.data.isEmpty) {
        setState(ViewState.NoDataAvailable);
        salonUncompletedOrders = resp.data;
        return false;
      }
      salonUncompletedOrders = resp.data;
      print(salonUncompletedOrders.length);
      print(salonUncompletedOrders[0].toMap());
      setState(ViewState.DataFetched);
      return true;
    } on NetworkException {
      Get.snackbar(
        'No Internet!',
        'Please check your internet Connection',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    } catch (e) {
      Get.snackbar(
        'An Error occured!',
        e.toString(),
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
    return false;
  }
}
