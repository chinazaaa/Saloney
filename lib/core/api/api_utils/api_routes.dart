class ApiRoutes {
  //base routes
  static const String base = 'https://saloney.herokuapp.com';
  static const String apiRoute = '$base';

  ///FCM token
  // static const String updateFCM = '$apiRoute/profile/fcm-token/update';

  ///Authentication Routes

  //Saloon auth
  static const String registerSalon = '$apiRoute/register/salon';
  static const String loginSalon = '$apiRoute/login/salon';
  static const String confirmSalonOTP = '$apiRoute/confirm/salon';



  //Customer auth
  static const String registerCustomer = '$apiRoute/register/customer';
  static const String loginCustomer = '$apiRoute/login/customer';
  static const String confirmCustomerOTP = '$apiRoute/confirm/customer';



  ///Profile Routes
  static const String getSalonProfile = '$apiRoute/salonOwner/salon/:id';
  static const String getSalonOwnerProfile = '$apiRoute/salonOwner/:id';
  static const String getCustomerProfile = '$apiRoute/customer/:id';
  static const String updateProfile = '$apiRoute/profile/update';
  static const String togglePushNotification = '$apiRoute/profile/passenger/update';

  //password
  static const String changePassword = '$apiRoute/profile/password/update';


}
