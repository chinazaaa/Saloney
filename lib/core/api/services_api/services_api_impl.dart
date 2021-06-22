import 'package:starter_project/core/api/api_utils/api_helper.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/service/get_unpublished_service_reponse.dart';
import 'package:starter_project/models/service/serviceResponses.dart';


import '../../../locator.dart';

class ServicesApiImpl extends ServicesApi {
  static const baseUrl = "https://saloney.herokuapp.com";

  //API client
  var server = locator<API>();

  @override
  Future<ApiResponse> createService(
      {String service,
      String description,
      String category,
      String price,
      String image}) async {
    String userId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      Map<String, dynamic> data = {
        "service": service,
        "description": description,
        "category": category,
        "price": price,
        "image": image,
        "api_token": locator<UserInfoCache>().token
      };
      var responsebody = await server.post(
          '$baseUrl/services/$userId', header, jsonEncode(data));
      CreateServiceResponse res = CreateServiceResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  @override
  Future<ApiResponse> getUnPublishedService({String salonId})async {
    String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      // Map<String, dynamic> data = {
      //   "api_token": locator<UserInfoCache>().token
      // };
      var responsebody = await server.get(
          '$baseUrl/unpublishedServices/$salonId', header);
      GetunPublishedServiceResponse res = GetunPublishedServiceResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
  


}
