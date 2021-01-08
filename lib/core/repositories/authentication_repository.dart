import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/authentication_api/authentication_api.dart';
import 'package:starter_project/infrastructure/user_info_cache.dart';
import 'package:starter_project/models/api_response_variants/customer_login_response.dart';
import 'package:starter_project/ui_helpers/responsive_state/base_view_model.dart';
import 'package:starter_project/ui_helpers/responsive_state/view_state.dart';

import '../../locator.dart';

class AuthRepository extends BaseNotifier {

  //API
  var authApi = locator<AuthenticationApi>();

  Future<bool> loginCustomer(String userName, String password) async {
    setState(ViewState.Busy);

    try {
      CustomerLoginResponse res = await authApi.loginCustomer(userName: userName, password: password);
      setState(ViewState.Idle);


      // Cache Login information
      var userInfoCache = locator<UserInfoCache>();
      await userInfoCache.cacheLoginResponse(customer: res);
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
  register(){}
}
