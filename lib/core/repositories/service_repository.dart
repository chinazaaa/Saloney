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
  }) async {
    setState(ViewState.Busy);
    try {
      ApiResponse res = await _api.createService(
          image: image,
          description: description,
          price: price,
          category: category,
          service: service);
      setState(ViewState.Idle);
      getUnpublishedServices(silently: true);
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

  List<UnpublishedService> unpublishedServices = [];
  Future<bool> getUnpublishedServices({bool silently = false}) async {
    if(!silently) setState(ViewState.Busy);
    UnpublishedServiceResponse resp;
    try {
      resp = await _api.getUnPublishedService();
      if(resp.data.isEmpty){
        setState(ViewState.NoDataAvailable);
        unpublishedServices = resp.data;
        return false;
      }
      unpublishedServices = resp.data;
      setState(ViewState.DataFetched);
      return true;
    } on NetworkException {
      setError('No Internet');
    } catch (e){
      setError(e.toString());
    }
    return false;
  }
}
