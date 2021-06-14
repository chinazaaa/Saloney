import 'package:dio/dio.dart';

class ApiUtils {
  static List<int> stringtoIntList(String value) {
    return value.split('.').map((e) => int.parse(e)).toList();
  }

  static String errorString(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        {
          return "Connection Error";
        }
        break;
      case DioErrorType.sendTimeout:
        {
          return "Send Timed Out";
        }
        break;
      case DioErrorType.receiveTimeout:
        {
          return "Receive Timed Out";
        }
        break;
      case DioErrorType.response:
        {
          return error.response.statusMessage;
          // "Response Timed Out";
        }
        break;
      case DioErrorType.cancel:
        {
          return "Request Cancelled. Please Try again";
        }
        break;
      case DioErrorType.other:
        {
          return "Connection Timed Out";
        }
        break;
      default:
        return 'Error Pls Try Again';
    }
  }
}
