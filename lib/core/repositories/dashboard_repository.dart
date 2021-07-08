import 'package:starter_project/core/api/dashboard_api/dashboard_api.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/models/api_response_variants/salondashboard_response.dart';

import '../../locator.dart';

class DashboardRepo extends BaseNotifier {
  // API
  final _api = locator<DashboardApi>();

  DashboardInfo salonDashboard;
  Future<bool> dashboard(String salonId) async {
    SalonDashboardResponse res;
    //setState(ViewState.Busy);
    try {
      res = await _api.salondashboard(
        salonId: salonId,
        //  bookingDate: bookingDate
      );
      //DashboardInfo salonDashboard;
      salonDashboard = res.data;
      setState(ViewState.Idle);
      //getUncompletedCustomerBookings(silently: true);
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
}
