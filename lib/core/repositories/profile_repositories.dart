import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/profile_api/profile_api.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/api_response_variants/salon_login_response.dart';
import 'package:starter_project/models/api_response_variants/update_customer_response.dart';
import 'package:starter_project/models/api_response_variants/update_salon_owner_response.dart';
import 'package:starter_project/models/api_response_variants/update_salon_response.dart';

import '../../locator.dart';

class ProfileRepo extends BaseNotifier with Validators {
  //Api
  var userInfoCache = locator<UserInfoCache>();
  final profileApi = locator<ProfileApi>();

  Future<bool> updateCustomerProfile(
    String userName,
    // String email,
    String phone,
  ) async {
    try {
      UpdateCustomerResponse res = await profileApi.updateCustomerProfile(
        userName: userName,
        // email: email,
        phone: phone,
      );
      //cache updated data
      await userInfoCache.updateCustomer(res.data);
      
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
    } 
    catch (e) {
      Get.snackbar(
        'An Error occured!',
        e.toString(),
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
    return false;
  }



  Future<ApiResponse> getSalonOwnerProfile() async {
    final salon = userInfoCache.salon;
    final response =
        await profileApi.getSalonOwnerProfile(id: salon.data.salon.id);
    print(response);
    return response;
  }

  Future<bool> getSalonProfile() async {
    //final salon = await userInfoCache.salonOwner.salon;
    final response = await profileApi.getSalonProfile();
  }

  Future<bool> getCustomerProfile() async {
    final response = await profileApi.getCustomerProfile();
  }

  Future<bool> updateSalonProfile(
    String nameOfSalon,
    String description,
    File image,
    String category,
    String address,
  ) async {
    try {
      UpdateSalonResponse res = await profileApi.updateSalonProfile(
          description: description,
          image: image,
          category: category,
          address: address,
          nameOfSalon: nameOfSalon);
      //cache updated data
      await userInfoCache.updateSalonInfo(res.data);
      // Get.snackbar(
      //   'Success!',
      //   'Salon Profile Updated',
      //   margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      //   snackStyle: SnackStyle.FLOATING,
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.black26,
      // );
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
        e.toString(),
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
  }

  Future<bool> updateSalonOwnerProfile(
    String userName,
    // String email,
    String phone,
  ) async {
    try {
      UpdateSalonOwnerResponse res = await profileApi.updateSalonUserProfile(
        userName: userName,
        // email: email,
        phone: phone,
      );
      //cache updated data
      await userInfoCache.updateSalonOwnerProfile(res.data);
      // Get.snackbar(
      //   'Success!',
      //   'User Profile Updated',
      //   margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      //   snackStyle: SnackStyle.FLOATING,
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.black26,
      // );
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
    }
    catch (e) {
      Get.snackbar(
        'An Error occured!',
        e.toString(),
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
    return false;


    
  }


Future<bool> changeSalonPassword(
    {String oldPassword,
    String newPassword,
    String confirmPassword}
  ) async {
    try {
      SalonLoginResponse res = await profileApi.changeSalonOwnerPassword(
       oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      //cache updated data
      //FIXME await userInfoCache.cacheLoginResponse(res.data);
      // Get.snackbar(
      //   'Success!',
      //   'User Profile Updated',
      //   margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      //   snackStyle: SnackStyle.FLOATING,
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.black26,
      // );
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
    } 
    // catch (e) {
    //   Get.snackbar(
    //     'An Error occured!',
    //     e.toString(),
    //     margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
    //     snackStyle: SnackStyle.FLOATING,
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.black26,
    //   );
    // }
    return false;


    
  }

  
}

