import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

dynamic responseHandler(http.Response response) async {
  print(response.body);
  print("status code: ${response.statusCode}");

  switch (response.statusCode) {
    case 201:
      return response.body;
      break;
    case 200:
      return response.body;
      break;
    case 400:
      return response.body;
      // break;
      // throw BadRequestException(response.body);
    case 401:
      return response.body;
      break;
    case 403:
      return response.body;
      // break;
      // throw UnauthorisedException(response.body.toString());
    case 409:
      return response.body;
      // break;
      // throw AlreadyRegisteredException(response.body.toString());
    case 422:
      return response.body;
      // break;
      // throw AlreadyRegisteredException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
