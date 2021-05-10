import 'package:starter_project/index.dart';

abstract class Api {
  // Future<void> logIn({String username, String password});
  Future<ApiResponse> updateCustomerProfile(
      String username, phoneNumber, address);
  Future<ApiResponse> updateSalonOwnerProfile();

  Future<ApiResponse> updateSalonProfile(
    String nameOfSalon,
    description,
    location,
    //FIXME
  );
}
