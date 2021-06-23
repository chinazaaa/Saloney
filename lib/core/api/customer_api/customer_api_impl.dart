import 'package:starter_project/core/api/api_utils/api_helper.dart';
import 'package:starter_project/core/api/api_utils/api_routes.dart';
import 'package:starter_project/core/api/customer_api/customer_api.dart';
import 'package:starter_project/infrastructure/user_info_cache.dart';
import 'package:starter_project/models/api_response.dart';
import 'package:starter_project/models/api_response_variants/get_salon_by_location_response.dart';

import '../../../locator.dart';

class CustomerApiImpl implements CustomerApi{
  @override//API client
  var server = locator<API>();
  Future<GetSalonByLocationResponse> getSalonByLocation({String latitude, String longitude}) async{
    var responsebody = await server.get('${ApiRoutes.salonByLocation}/$latitude/$longitude', header);
    GetSalonByLocationResponse response = GetSalonByLocationResponse.fromJson(responsebody);
    return response;
  }

  Map<String, String> get header => {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'x-access-token': locator<UserInfoCache>().token
  };

}