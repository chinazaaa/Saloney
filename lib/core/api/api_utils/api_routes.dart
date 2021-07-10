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
  static const String salonByLocation = '$apiRoute/salonbylocation';

  ///Get Profile Routes
  static const String getSalonProfile = '$apiRoute/salonOwner/salon';
  static const String getSalonOwnerProfile = '$apiRoute/salonOwner';
  //customer
  static const String getCustomerProfile = '$apiRoute/customer';
  static const String customerGetServices = '$apiRoute/publishedServices';

  //update profile routes
  static const String updateSalonOwnerProfile = '$apiRoute/profile/salonOwner';
  static const String updateSalonProfile = '$apiRoute/profile/salon';

// salon gallery
  static const String salonGallery =
      '$apiRoute/profile/gallery';
  //update customer
  static const String updateCustomerProfile = '$apiRoute/profile/customer';

//resend otp
static const String resendOTP = '$apiRoute/resend/otp';

  //toggle
  static const String togglePushNotification =
      '$apiRoute/profile/passenger/update';

  //password
  static const String changeSalonOwnerPassword =
      '$apiRoute/salonOwner/changePassword';
  static const String changeCustomerPassword =
      '$apiRoute/customer/changePassword';

// creeate booking
  static const String createBooking =
      '$apiRoute/booking';
// uncompleted orders by customer
  static const String customerUncompletedOrders =
      '$apiRoute/uncompleted/customer/booking';

// completed orders by customer
  static const String customerCompletedOrders =
      '$apiRoute/completed/customer/booking';

      // uncompleted orders by salon
  static const String salonUncompletedOrders =
      '$apiRoute/uncompleted/salon/booking';

// completed orders by salon
  static const String salonCompletedOrders =
      '$apiRoute/completed/salon/booking';

// complete orders by customer
  static const String customerCompleteOrders =
      '$apiRoute/complete/customer/booking';

      // complete orders by salon
  static const String salonCompleteOrders =
      '$apiRoute/complete/salon/booking';
// approved orders
  static const String approveOrders =
      '$apiRoute/approve/booking';

      // unapproved orders
  static const String unApproveOrders =
      '$apiRoute/unapproved/salon/booking';
// reject orders
static const String rejectOrders =
      '$apiRoute/reject/booking';

// salon dashboard
  static const String salonDashboard =
      '$apiRoute/dashboard';


}

