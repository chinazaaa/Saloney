import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:starter_project/core/api/api_utils/api_helper.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/service/get_published_service_reponse.dart';
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
      };

      FormData formData;

      if (image != null) {
        String imgname = DateTime.now().millisecondsSinceEpoch.toString();
        formData = FormData.fromMap({
          "service": service,
          "description": description,
          "category": category,
          "price": price,
          "image": await MultipartFile.fromFile(
            image,
            filename: '$imgname/$image',
            contentType: MediaType('image', 'jpg'),
          ),
        });
      }

      var responsebody = await server.post(
          '$baseUrl/services/$userId', xHeader, jsonEncode(data), multimediaRequest: formData);
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

  Map<String, String> get xHeader => {
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
    'x-access-token': '${locator<UserInfoCache>().token}',
  };
  
  @override
  Future<ApiResponse> getUnPublishedService({String salonId}) async {
    String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody =
          await server.get('$baseUrl/unpublishedServices/$salonId', xHeader);
      UnpublishedServiceResponse res =
          UnpublishedServiceResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }

  @override
  Future<ApiResponse> getPublishedService({String salonId}) async {
    String salonId = locator<UserInfoCache>().salon.data.salon.id.toString();
    try {
      var responsebody =
          await server.get('$baseUrl/publishedServices/$salonId', xHeader);
      PublishedServiceResponse res =
          PublishedServiceResponse.fromJson(responsebody);
      return res;
    } on SocketException {
      throw NetworkException();
    }
  }
}
