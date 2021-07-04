import 'package:starter_project/core/api/dashboard_api.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/models/api_response_variants/salondashboard_response.dart';

import '../../locator.dart';

class DashboardRepo extends BaseNotifier {
  // API
  final _api = locator<DashboardApi>();
  SalonDashboardResponse dashboardResponse;
  Future<bool> dashboard({
    String id,
    // String customerId,
    // String bookingDate,
  }) async {
    setState(ViewState.Busy);
    try {
      ApiResponse res = await _api.salondashboard(
        id: id,
        //  bookingDate: bookingDate
      );
      dashboardResponse = res;
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
