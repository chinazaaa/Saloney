import 'package:http/http.dart' as http;
import 'package:starter_project/models/api_response.dart';

import 'network_exceptions.dart';

dynamic responseHandler(http.Response response) async {

  //Attempt to derive error message
  String exceptionMsg;
  try{
    ApiResponse responsebody = ApiResponse.fromJson(response.body);
    exceptionMsg = responsebody.message;
  } catch(e){
    print("Error deriving error message: $e");
    exceptionMsg = response.body;
  }

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
      throw BadRequestException(exceptionMsg);
    case 401:
    case 403:
      throw UnauthorisedException(exceptionMsg);
    case 404:
      throw FileNotFoundException(exceptionMsg);
    case 422:
      throw AlreadyRegisteredException(exceptionMsg);
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
