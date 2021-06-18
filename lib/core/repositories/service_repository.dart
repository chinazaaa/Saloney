import 'package:starter_project/index.dart';
import 'package:starter_project/models/service/get_unpublished_service_reponse.dart';
import 'package:starter_project/models/service/serviceResponses.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';

import '../../locator.dart';

class ServiceRepo extends BaseNotifier {
  // API
  final _api = locator<ServicesApi>();

  Future<bool> addService({
    String service,
    description,
    price,
    category,
    // bool isPublished
  }) async {
    setState(ViewState.Busy);

    // List serviceList = [];

    CreateServiceResponse resp;
    try {
      resp = await _api.createService(
        service: service,
        description: description,
        price: price,
        category: category,
        // isPublished: isPublished
      );

      setState(ViewState.Idle);

      if (resp.success) {
        //Cache login info
        print(resp.data);

        return true;
      } else {
        Get.snackbar(
          'Error',
          '${resp.message}',
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black26,
        );
        return false;
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
    return 
    false;
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
