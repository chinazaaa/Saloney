import 'package:starter_project/core/api/api_utils/api_helper.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/index.dart';
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
      String price}) async {
    String userId = locator<UserInfoCache>().salon.data.id.toString();
    try {
      Map<String, dynamic> data = {
        "service": service,
        "description": description,
        "category": category,
        "price": price,
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
  Future<ApiResponse> updateCustomerProfile(
      String username, phoneNumber, address) {
    // TODO: implement updateCustomerProfile
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> updateSalonOwnerProfile() {
    // TODO: implement updateSalonOwnerProfile
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> updateSalonProfile(
      String nameOfSalon, description, location) {
    // TODO: implement updateSalonProfile
    throw UnimplementedError();
  }
}
