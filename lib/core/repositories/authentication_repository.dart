import 'package:flutter/material.dart';
import 'package:starter_project/core/api/authentication_api/authentication_api.dart';
import 'package:starter_project/ui_helpers/responsive_state/base_view_model.dart';
import 'package:starter_project/ui_helpers/responsive_state/view_state.dart';

import '../../locator.dart';

class AuthRepository extends BaseNotifier {

  //API
  var authApi = locator<AuthenticationApi>();

  Future<bool> loginCustomer(String userName, String password) async {
    setState(ViewState.Busy);

    try {
      LoginApiResponse res = await authApi.loginCustomer(userName: userName, password: password);
      setState(ViewState.Idle);

      //Check if the user trying to login is a passenger
      if (res.data.user.user_type != "passenger") {
        Get.snackbar(
          'Wrong user type!',
          'This phone number is not registered as a passenger. Please use a passenger account',
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black26,
        );
        return false;
      }

      // Cache Login information
      var userInfoCache = locator<UserInfoCache>();
      LoginResponse response = res.data;
      await userInfoCache.cacheLoginResponse(response);
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
    } on LoginFailedException {
      Get.snackbar(
        'Incorrect credentials',
        'You have entered a wrong username or password',
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
