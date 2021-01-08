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
      throw BadRequestException(response.body);
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 409:
      throw AlreadyRegisteredException(response.body.toString());
    case 422:
      throw AlreadyRegisteredException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
