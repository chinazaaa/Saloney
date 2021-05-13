import 'package:starter_project/index.dart';

class ProfileRepo extends BaseNotifier {
  // API
  Api _api = Get.find();

  // FIXME add support for image
  Future<ApiResponse> update_S_Profile({
    int salonId,
    String nameOfSalon,
    description,
    location,
  }) {
    setState(ViewState.Busy);
  }
}
