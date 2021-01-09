class OverlayRemoveFailException implements Exception {
  String title;
  String message;
  OverlayRemoveFailException(
      {this.title = 'Overlay remove fail error', this.message});
}

class IncorrectOTPException implements Exception {
  String title;
  String message;
  IncorrectOTPException({this.title = 'Incorrect OTP', this.message});
}

class LoginFailedException implements Exception {
  String title;
  String message;
  LoginFailedException({this.title = 'Wrong login credentials', this.message});
}

class RegistrationFailedException implements Exception {
  String title;
  String message;
  RegistrationFailedException(
      {this.title = 'Registration Failed', this.message});
}

class OTPFailedException implements Exception {
  String title;
  String message;
  OTPFailedException({this.title = 'OTP request Failed', this.message});
}

class InsufficientBalanceException implements Exception {
  String title;
  String message;
  InsufficientBalanceException({this.title = 'Insufficient Balance', this.message});
}
