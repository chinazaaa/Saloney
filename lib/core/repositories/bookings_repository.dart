//import 'package:starter_project/Salon/pages/screens/published_service.dart';
import 'package:starter_project/core/api/bookings_api/bookings_api.dart';
import 'package:starter_project/index.dart';
//import 'package:starter_project/models/api_response_variants/bookings_response.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/models/api_response_variants/bookings_response.dart';
import 'package:starter_project/models/api_response_variants/complete_booking_response.dart';
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
      setError("No Internet!");
    } catch (e) {
      setError("An error occured!\n${e.toString()}");
    }
    return false;
  }
  
  List<Booking> salonCompletedOrders = [];
  Future<bool> getSalonCompletedBookings({bool silently = false}) async {
    if (!silently) {
      if (salonCompletedOrders.isEmpty) setState(ViewState.Busy);
    }
    AllBookingResponse resp;
    try {
      resp = await _api.getSalonCompletedBookings();
      if (resp.data.isEmpty) {
        setState(ViewState.NoDataAvailable);
        salonCompletedOrders = resp.data;
        return false;
      }
      salonCompletedOrders = resp.data;
      print(salonCompletedOrders.length);
      print(salonCompletedOrders[0].toMap());
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
    } 
    catch (e) {
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

  List<Booking> customerUncompletedOrders = [];
  Future<bool> getCustomerUnCompletedBookings({bool silently = false}) async {
    if (!silently) {
      if (customerUncompletedOrders.isEmpty) setState(ViewState.Busy);
    }
    AllBookingResponse resp;
    try {
      resp = await _api.getCustomerUnCompletedBookings();
      if (resp.data.isEmpty) {
        setState(ViewState.NoDataAvailable);
        customerUncompletedOrders = resp.data;
        return false;
      }
      customerUncompletedOrders = resp.data;
      print(customerUncompletedOrders.length);
      print(customerUncompletedOrders[0].toMap());
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
    } 
     catch (e) {
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
  List<Booking> customerCompletedOrders = [];
  Future<bool> getCustomerCompletedBookings({bool silently = false}) async {
    if (!silently) {
      if (customerCompletedOrders.isEmpty) setState(ViewState.Busy);
    }
    AllBookingResponse resp;
    try {
      resp = await _api.getCustomerCompletedBookings();
      if (resp.data.isEmpty) {
        setState(ViewState.NoDataAvailable);
        customerCompletedOrders = resp.data;
        return false;
      }
      customerCompletedOrders = resp.data;
      print(customerCompletedOrders.length);
      print(customerCompletedOrders[0].toMap());
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
    } 
    catch (e) {
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


Future<bool> completeCustomerOrders({
    String bookingID,
  }) async {
    try {
      CompleteBookingResponse res = await _api.completeCustomerBookings(
        bookingID: bookingID);
      getCustomerUnCompletedBookings(silently: true);
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
    } 
    catch (e) {
      Get.snackbar(
        'An Error occured!',
        'Please try again in a bit. \nDetails: $e',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
    setState(ViewState.Idle);
    return false;
  }


Future<bool> completeSalonOrders({
    String bookingID,
  }) async {
    try {
      CompleteBookingResponse res = await _api.completeSalonBookings(
        bookingID: bookingID);
      getSalonUnCompletedBookings(silently: true);
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
    } 
    catch (e) {
      Get.snackbar(
        'An Error occured!',
        'Please try again in a bit. \nDetails: $e',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
    setState(ViewState.Idle);
    return false;
  }

Future<bool> approveOrders({
    String bookingID,
  }) async {
    try {
      CompleteBookingResponse res = await _api.approveBookings(
        bookingID: bookingID);
      getSalonUnCompletedBookings(silently: true);
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
    } 
    catch (e) {
      Get.snackbar(
        'An Error occured!',
        'Please try again in a bit. \nDetails: $e',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
    setState(ViewState.Idle);
    return false;
  }

Future<bool> rejectOrders({
    String bookingID,
  }) async {
    try {
      CompleteBookingResponse res = await _api.rejectBookings(
        bookingID: bookingID);
      getSalonUnCompletedBookings(silently: true);
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
    } 
    catch (e) {
      Get.snackbar(
        'An Error occured!',
        'Please try again in a bit. \nDetails: $e',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
    setState(ViewState.Idle);
    return false;
  }

  List<Booking> salonUnApprovedOrders = [];
  Future<bool> getSalonUnApprovedBookings({bool silently = false}) async {
    if (!silently) {
      if (salonUnApprovedOrders.isEmpty) setState(ViewState.Busy);
    }
    AllBookingResponse resp;
    try {
      resp = await _api.getUnapproveBookings();
      if (resp.data.isEmpty) {
        setState(ViewState.NoDataAvailable);
        salonUnApprovedOrders = resp.data;
        return false;
      }
      salonUnApprovedOrders = resp.data;
      print(salonUnApprovedOrders.length);
      print(salonUnApprovedOrders[0].toMap());
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
    } 
    catch (e) {
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
