import 'package:starter_project/core/api/profile_api/profile_api.dart';
import 'package:starter_project/index.dart';

import '../../locator.dart';

class ProfileRepo extends BaseNotifier {

  //Api
  final profileApi = locator<ProfileApi>();

  Future<bool> updateCustomerProfile() {}

  Future<bool> updateSaloonProfile(
    String salonName,
    String description,
    File image,
    String category,
    String location,
  ) {

  }
}
