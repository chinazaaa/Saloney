//import 'package:starter_project/Salon/pages/screens/published_service.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/service/get_published_service_reponse.dart';
import 'package:starter_project/models/service/get_unpublished_service_reponse.dart';
import 'package:starter_project/models/service/get_published_service_reponse.dart';
import 'package:starter_project/models/service/salon_service.dart';
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

  Future<bool> updateService(
      {String service,
      String description,
      String category,
      String price,
      String image,
      String serviceId}) async {
    setState(ViewState.Busy);
    try {
      ApiResponse res = await _api.updateService(
          image: image,
          description: description,
          price: price,
          category: category,
          service: service,
          serviceId: serviceId);
      setState(ViewState.Idle);
      //getUnpublishedServices(silently: true);
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

  List<SalonService> unpublishedServices = [];
  Future<bool> getUnpublishedServices({bool silently = false}) async {
    if (!silently) {
      if (unpublishedServices.isEmpty) setState(ViewState.Busy);
    }
    UnpublishedServiceResponse resp;
    try {
      resp = await _api.getUnPublishedService();
      if (resp.data.isEmpty) {
        setState(ViewState.NoDataAvailable);
        unpublishedServices = resp.data;
        return false;
      }
      unpublishedServices = resp.data;
      setState(ViewState.DataFetched);
      return true;
    } on NetworkException {
      setError('No Internet');
    } catch (e) {
      setError(e.toString());
    }
    return false;
  }

  List<SalonService> publishedServices = [];
  Future<bool> getPublishedServices({bool silently = false}) async {
    if (!silently) {
      if (publishedServices.isEmpty) setState(ViewState.Busy);
    }
    PublishedServiceResponse resp;
    try {
      resp = await _api.getPublishedService();
      if (resp.data.isEmpty) {
        setState(ViewState.NoDataAvailable);
        publishedServices = resp.data;
        return false;
      }
      publishedServices = resp.data;
      setState(ViewState.DataFetched);
      return true;
    } on NetworkException {
      setError('No Internet');
    } catch (e) {
      setError(e.toString());
    }
    return false;
  }

  Future<bool> publishService({
    String serviceId,
  }) async {
    try {
      ApiResponse res = await _api.publishService(serviceId: serviceId);
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

  Future<bool> unpublishService({
    String serviceId,
  }) async {
    try {
      ApiResponse res = await _api.unpublishService(serviceId: serviceId);
      getPublishedServices(silently: true);
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
    return false;
  }

  Future<bool> deleteUnpublishedService({
    String serviceId,
  }) async {
    try {
      ApiResponse res =
          await _api.deleteUnpublishedService(serviceId: serviceId);
      getPublishedServices(silently: true);
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
    return false;
  }

  Future<bool> deletePublishedService({
    String serviceId,
  }) async {
    try {
      ApiResponse res = await _api.deletePublishedService(serviceId: serviceId);
      getPublishedServices(silently: true);
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
    return false;
  }
}
