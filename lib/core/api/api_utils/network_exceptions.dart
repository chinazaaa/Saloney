class AppException implements Exception {
  final message;
  final prefix;

  AppException([this.message, this.prefix]);

  String toString() {
    return "$prefix$message";
  }
}

class FileNotFoundException extends AppException {
  FileNotFoundException([String message]) : super(message, "File not found ");
}

class NetworkException extends AppException {
  NetworkException([String message]) : super(message, "No Internet ");
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: 'Request Timed Out' ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message])
      : super(message, "Unauthorised: 'Incorrect Username or password' ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class AlreadyRegisteredException extends AppException {
  AlreadyRegisteredException([String message])
      : super(message, "Invalid Input: ");
}

class InternalServerException extends AppException {
  InternalServerException([message])
      : super(message,
            "An error occurred. But it's on us. Please contact support if error persists");
}
