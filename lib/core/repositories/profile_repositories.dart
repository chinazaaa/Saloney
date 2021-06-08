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
  ) {}
}
