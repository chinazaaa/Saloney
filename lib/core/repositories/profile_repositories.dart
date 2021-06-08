import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/profile_api/profile_api.dart';
import 'package:starter_project/index.dart';

import '../../locator.dart';

class ProfileRepo extends BaseNotifier with Validators {
  //Api
  var userInfoCache = locator<UserInfoCache>();
  final profileApi = locator<ProfileApi>();

  Future<bool> updateCustomerProfile() {}

  Future<ApiResponse> getSalonOwnerProfile() async {
    final salon = userInfoCache.salon;
    final response = await profileApi.getSalonOwnerProfile(id: salon.data.salon.id);
    print(response);
    return response ;
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
    String location,
  ) async {
    try {
      ApiResponse res = await profileApi.updateSalonProfile(
          description: description,
          image: image,
          category: category,
          location: location,
          nameOfSalon: nameOfSalon
      );
      Get.snackbar(
        'Success!',
        'Salon Profile Updated',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
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
        String username,
        String email,
        String phone,
        ) async{
      try {
        ApiResponse res = await profileApi.updateSalonOwner(
            username: username,
            email: email,
            phone: phone,
        );
        Get.snackbar(
          'Success!',
          'User Profile Updated',
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black26,
        );
        return true;
      } on NetworkException{
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
