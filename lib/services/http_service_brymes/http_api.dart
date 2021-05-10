import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:starter_project/index.dart';

class HttpApi extends Api {
  static HttpApi api;
  static const testBaseUrl = "https://saloney.herokuapp.com";
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
    dio.options.baseUrl = testBaseUrl;
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
  Future<ApiResponse> updateSalonProfile(
      int salonId, String nameOfSalon, description, location) async {
    Response res;
    Map<String, dynamic> data;
    data = {};

    print(data);

    try {
      var responseBody = await dio.put(
        '/profile/salon/:id'
      );
    }
  }

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
