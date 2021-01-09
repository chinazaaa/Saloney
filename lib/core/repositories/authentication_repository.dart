import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/authentication_api/authentication_api.dart';
import 'package:starter_project/infrastructure/user_info_cache.dart';
import 'package:starter_project/models/api_response_variants/customer_login_response.dart';
import 'package:starter_project/models/api_response_variants/customer_registration_response.dart';
import 'package:starter_project/models/api_response_variants/salon_login_response.dart';
import 'package:starter_project/models/api_response_variants/salon_registration_response.dart';
import 'package:starter_project/ui_helpers/responsive_state/base_view_model.dart';
import 'package:starter_project/ui_helpers/responsive_state/view_state.dart';

import '../../locator.dart';

class AuthRepository extends BaseNotifier {

  //API
  var authApi = locator<AuthenticationApi>();

  Future<Cache> login(String userName, String password, bool isCustomer) async {
    setState(ViewState.Busy);
    CustomerLoginResponse customer;
    SalonLoginResponse salon;
    try {
      if(isCustomer){
        customer = await authApi.loginCustomer(userName: userName, password: password);
        setState(ViewState.Idle);

        // Cache Login information
        var userInfoCache = locator<UserInfoCache>();
        await userInfoCache.cacheLoginResponse(customer: customer);
      }
      //is salon
      else {
        salon = await authApi.loginCustomer(userName: userName, password: password);
        setState(ViewState.Idle);

        // Cache Login information
        var userInfoCache = locator<UserInfoCache>();
        await userInfoCache.cacheLoginResponse(salon: salon);
      }

      return Cache(customer: customer, salon: salon);
    } on NetworkException {
      Get.snackbar(
        'No Internet!',
        'Check Internet Connection and try again',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    } catch (e) {
      Get.snackbar(
        'An Error Occured!',
        'Please try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black45,
      );
    }

    setState(ViewState.Idle);
    return null;
  }

  Future<bool> register({bool isCustomer = true, String userName, String password, String email, String location, String nameOfSalon, String phone, String typeOfSalon}) async{
    setState(ViewState.Busy);

    try {
      if (isCustomer) {
        CustomerRegistrationResponse res = await authApi.registerCustomer(userName: userName, password: password, email: email, phone: phone,);
      }  else {
        SalonRegistrationResponse res = await authApi.registerSaloon(userName: userName, password: password, email: email, location: location, nameOfSalon: nameOfSalon, phone: phone, typeOfSalon: typeOfSalon);
      }

      setState(ViewState.Idle);

      return true;
    } on NetworkException {
      Get.snackbar(
        'No Internet!',
        'Check Internet Connection and try again',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    } catch (e) {
      Get.snackbar(
        'An Error Occured!',
        'Please try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black45,
      );
    }

    setState(ViewState.Idle);
    return false;
  }
}
