import 'package:starter_project/index.dart';
import 'package:starter_project/models/service/get_unpublished_service_reponse.dart';
import 'package:starter_project/models/service/serviceResponses.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';

import '../../locator.dart';

class ServiceRepo extends BaseNotifier {
  // API
  final _api = locator<ServicesApi>();

  Future<bool> createService({
    String service,
    String description,
    String category,
    String price,
    String image,
  }) async{
    setState(ViewState.Busy);
    try {
      ApiResponse res = await _api.createService(image: image, description: description, price: price, category: category, service: service);
      setState(ViewState.Idle);
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


  Future<GetunPublishedServiceResponse> getUnpublishedServices() async {
    setState(ViewState.Busy);

    // List serviceList = [];

    GetunPublishedServiceResponse resp;
    try {
      resp = await _api.getUnPublishedService(
          );

      setState(ViewState.Idle);

      if (resp.success) {
        //Cache login info
        print(resp.data);

        return resp;
      } else {
        Get.snackbar(
          'Error',
          '${resp.message}',
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black26,
        );
        return resp;
      }
    } on NetworkException {
      Get.snackbar(
        'No Internet!',
        'Check Internet Connection and try again',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }

    setState(ViewState.Idle);
    return resp;
  }
}
