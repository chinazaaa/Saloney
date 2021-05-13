import 'package:dio/dio.dart';

class ApiUtils {
  static List<int> stringtoIntList(String value) {
    return value.split('.').map((e) => int.parse(e)).toList();
  }

  static String errorString(DioError error) {
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return "Connection Error";
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return "Send Timed Out";
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return "Receive Timed Out";
        }
        break;
      case DioErrorType.RESPONSE:
        {
          return error.response.statusMessage;
          // "Response Timed Out";
        }
        break;
      case DioErrorType.CANCEL:
        {
          return "Request Cancelled. Please Try again";
        }
        break;
      case DioErrorType.DEFAULT:
        {
          return "Connection Timed Out";
        }
        break;
      default:
        return 'Error Pls Try Again';
    }
  }
}
