import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:starter_project/core/api/api_utils/api_helper.dart';
import 'package:starter_project/core/api/api_utils/api_routes.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/dashboard_api/dashboard_api.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/api_response_variants/salondashboard_response.dart';

import '../../../locator.dart';

class SalonDashboardImpl implements DashboardApi {

    var server = locator<API>();

  @override
  Future<ApiResponse> salondashboard({String salonId}) async {
     Map<String, String> header = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'x-access-token': locator<UserInfoCache>().token
    };
       try {
      var responsebody = await server.get(
          '${ApiRoutes.salonDashboard}/${locator<UserInfoCache>().salon.data.salon.id}', header);
      SalonDashboardResponse res = SalonDashboardResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
  

}
