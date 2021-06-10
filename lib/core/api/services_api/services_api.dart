import 'package:starter_project/index.dart';

abstract class ServicesApi {
  // Future<ApiResponse> updateCustomerProfile(
  //   String username,
  //   phoneNumber,
  //   address,
  // );
  // Future<ApiResponse> updateSalonOwnerProfile();

  // Future<ApiResponse> updateSalonProfile(
  //   String nameOfSalon,
  //   description,
  //   location,
  // );

  Future<ApiResponse> createService({
    String service,
    String description,
    String category,
    String price,
  });
}
