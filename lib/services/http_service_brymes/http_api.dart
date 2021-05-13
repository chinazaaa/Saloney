import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/core/api/api_utils/apiUtils.dart';
import 'package:starter_project/models/service/serviceResponses.dart';

class HttpApi extends Api {
  static HttpApi api;
  static const baseUrl = "https://saloney.herokuapp.com";
  StorageUtil _storageUtil = Get.find(); //FIXME what do i do this
  Dio dio = Dio();

  static HttpApi getInstance() {
    if (api == null) {
      HttpApi placeholder = HttpApi();
      placeholder.setUpDio();
      api = placeholder;
    }
    return api;
  }

  void setUpDio() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 120000;
    dio.options.receiveTimeout = 120000;
    // FIXME dio.interceptors.add(interceptor);
  }

  // @override
  // Future<void> updateCustomerProfile(String username, email) async {
  //   Response res;
  //   Map<String, dynamic> data;
  // }
  @override
  Future<ApiResponse> createService(
      {String service,
      String description,
      String category,
      String price}) async {
    try {
      Map<String, dynamic> data = {
        "service": service,
        "description": description,
        "category": category,
        "price": price,
        "api_token": await jwt
      };

      print("Here is a request...");
      var userId = "";
      var response = await dio.post(
        'service/$userId',
        //FIXME does /service?uderid work
        data: data,
        onSendProgress: (int percent, int total) {
          print(percent);
          print(total);
        },
      );
      CreateServiceResponse res = CreateServiceResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      print('#' * 100);
      print("there is an error");
      print(e.response?.statusMessage);
      print('#' * 100);

      if (e.response?.statusCode == 401) {
        throw UnauthorisedException();
      } else if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        throw FetchDataException();
      } else if (e.response?.statusCode == 500) {
        throw InternalServerException();
      } else if (e.response == null) {
        throw NetworkException();
      } else {
        throw ApiUtils.errorString(e);
      }
    } catch (e) {
      print('#' * 100);
      print("there is an error");
      print(e.toString());
      throw ApiUtils.errorString(e);
    }
  }

  //getters
  Future<String> get jwt async => await _storageUtil.readToken(ACCESS_TOKEN);

  // FIXME Saloney_API has issue interpreting headers.. put token in req body instead
  Future<Map<String, String>> get headers async => {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${(await jwt)}',
      };

  //FIXME write interceptor to auto refresh tokens
  /* InterceptorsWrapper get interceptor => InterceptorsWrapper(
        onError: (DioError error) async {
          print('INTERCEPTING ERROR ...');
          print(error.response?.statusCode);
          if (error.response?.statusCode == 401 && await jwt != null) {
            Options options = error.response.request;
            String path = error.request.path;
            Dio newDio = Dio();

            // Lock dio to block the incoming request until the token updated
            dio.lock();

            // get a new token
            // Response res = await newDio.post(
            //   "${testBaseUrl}refresh",
            //   options: Options(
            //     headers: {
            //       "Content-Type": "application/json",
            //       'Authorization':
            //           'Bearer ${await _storageUtil.readToken(REFRESH_TOKEN)}',
            //     },
            //   ),
            // );
            // print(res.statusCode);
            // print(res.data);

            // // save and replace the previous token
            // await _storageUtil.saveToken(ACCESS_TOKEN, res.data['token']);
            // options.headers = await headers;

            // clear new dio instance and unlock main dio
            newDio.clear();
            dio.unlock();

            // repeat the previous request with the new token
            return await dio.request(path, options: options);
          }
          return error;
        },
      ); */

  // AUTHORIZATION
}

/* var url = _buildPath(path, {
  'search': 'How to become a hero like LyNam'
});
 var result = await dio.post(url,....);

String _buildPath(String path, Map<String, String> query) {
    String url = path;
    if (query != null) {
      url += ":";
      var temp = "";
      query.forEach((k, v) {
        if (v != null && v.isNotEmpty)
          temp += "&$k=$v";
      });

      url += temp.replaceFirst("&", "");
      url = url.replaceFirst("?", "", url.length - 1);
    }
    
    return url;
  } */
