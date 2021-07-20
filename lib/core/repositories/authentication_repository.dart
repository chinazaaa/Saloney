import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/authentication_api/authentication_api.dart';
import 'package:starter_project/core/mixin/validators.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/infrastructure/user_info_cache.dart';
import 'package:starter_project/models/api_response_variants/customer_login_response.dart';
import 'package:starter_project/models/api_response_variants/customer_registration_response.dart';
import 'package:starter_project/models/api_response_variants/resend_otp_response.dart';
import 'package:starter_project/models/api_response_variants/salon_login_response.dart';
import 'package:starter_project/models/api_response_variants/salon_registration_response.dart';
import 'package:starter_project/ui_helpers/responsive_state/base_view_model.dart';
import 'package:starter_project/ui_helpers/responsive_state/view_state.dart';

import '../../locator.dart';

class AuthRepository extends BaseNotifier with Validators {
  bool checkboxValue = false;
  toggleCheckbox() {
    checkboxValue = !checkboxValue;
    notifyListeners();
  }

  //API
  var authApi = locator<AuthenticationApi>();

  Future<bool> login({String email, String password, bool isCustomer}) async {
    setState(ViewState.Busy);

    CustomerLoginResponse customer;
    SalonLoginResponse salon;

    try {
      if (isCustomer) {
        customer =
            await authApi.loginCustomer(email: email, password: password);
        setState(ViewState.Idle);

        if (customer.success) {
          // Cache Login information
          var userInfoCache = locator<UserInfoCache>();
          await userInfoCache.cacheLoginResponse(customer: customer);

          return true;
        } else {
          Get.snackbar(
            'Error',
            '${customer.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
        }
      }
      //is salon
      else {
        salon = await authApi.loginSaloon(email: email, password: password);
        setState(ViewState.Idle);
        print(salon);
        if (salon.success == true) {
          // Cache Login information
          var userInfoCache = locator<UserInfoCache>();
          await userInfoCache.cacheLoginResponse(salon: salon);
          return true;
        } 
        else {
          Get.snackbar(
            'Error',
            '${salon.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
        }
      }
      return false;
    } on NetworkException {
      Get.snackbar(
        'No Internet!',
        'Check Internet Connection and try again',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    } on UnauthorisedException {
      Get.snackbar(
        'Incorrect credentials!',
        'Please check your username and password',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    } 
    catch (e) {
      Get.snackbar(
        'An Error Occured!',
        'Please try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black45,
      );
      print(e);
    }

    setState(ViewState.Idle);
    return false;
  }

  Future<bool> register(
      {bool isCustomer = true,
      String userName,
      String password,
      String email,
      String address,
      String nameOfSalon,
      String phone,
      String typeOfSalon}) async {
    setState(ViewState.Busy);

    try {
      if (isCustomer) {
        CustomerRegistrationResponse res = await authApi.registerCustomer(
          userName: userName,
          password: password,
          email: email,
          phone: phone,
        );
        setState(ViewState.Idle);
        if (res.success) {
          var userInfoCache = locator<UserInfoCache>();
          await userInfoCache.updateRegistrationInfo(customerReg: res);
          return true;
        } else {
          Get.snackbar(
            'An Error Occured',
            '${res.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
          return false;
        }
      } else {
        SalonRegistrationResponse res = await authApi.registerSaloon(
            userName: userName,
            password: password,
            email: email,
            address: address,
            nameOfSalon: nameOfSalon,
            phone: phone,
            typeOfSalon: typeOfSalon);
        setState(ViewState.Idle);
        if (res.success) {
          var userInfoCache = locator<UserInfoCache>();
          await userInfoCache.updateRegistrationInfo(salonReg: res);
          return true;
        } else {
          Get.snackbar(
            'An Error Occured',
            '${res.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
          return false;
        }
      }

      // return false; FIXME dead code
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

  Future<bool> confirmOTP({bool isCustomer = true, String otp}) async {
    // FIXME Unused  SalonRegistrationResponse salon;
    // FIXME Unused  CustomerRegistrationResponse customer;

    try {
      if (isCustomer) {
        CustomerRegistrationResponse customer =
            await authApi.confirmCustomerOTP(otp: otp);
        setState(ViewState.Idle);
        if (customer.success) {
          return true;
        } else {
          Get.snackbar(
            'An Error Occured',
            '${customer.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
        }
      } else {
        SalonRegistrationResponse salon =
            await authApi.confirmSaloonOTP(otp: otp);
        setState(ViewState.Idle);
        if (salon.success) {
          return true;
        } else {
          Get.snackbar(
            'An Error Occured',
            '${salon.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
        }
      }

      setState(ViewState.Idle);
      return false;
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


  Future<bool> resendOTP({bool isCustomer = true, String email}) async {
    // FIXME Unused  SalonRegistrationResponse salon;
    // FIXME Unused  CustomerRegistrationResponse customer;

    try {
      if (isCustomer) {
        ResendOTPResponse customer =
            await authApi.resendOTPCustomer(email: email);
        setState(ViewState.Idle);
        if (customer.success) {
          return true;
        } else {
          Get.snackbar(
            'An Error Occured',
            '${customer.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
        }
      } else {
        ResendOTPResponse salon =
            await authApi.resendOTPSalon(email: email);
        setState(ViewState.Idle);
        if (salon.success) {
          return true;
        } else {
          Get.snackbar(
            'An Error Occured',
            '${salon.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
        }
      }

      setState(ViewState.Idle);
      return false;
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
    catch (e) {
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


  Future<bool> forgotPassword({bool isCustomer = true, String email}) async {
    // FIXME Unused  SalonRegistrationResponse salon;
    // FIXME Unused  CustomerRegistrationResponse customer;

    try {
      if (isCustomer) {
        ResendOTPResponse customer =
            await authApi.resendOTPCustomer(email: email);
        setState(ViewState.Idle);
        if (customer.success) {
          return true;
        } else {
          Get.snackbar(
            'An Error Occured',
            '${customer.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
        }
      } else {
        ResendOTPResponse salon =
            await authApi.resendOTPSalon(email: email);
        setState(ViewState.Idle);
        if (salon.success) {
          return true;
        } else {
          Get.snackbar(
            'An Error Occured',
            '${salon.message}',
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black26,
          );
        }
      }

      setState(ViewState.Idle);
      return false;
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
    catch (e) {
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


  Future<bool> logout() async {
    await locator<UserInfoCache>().clearCache();
    return true;
  }
}
