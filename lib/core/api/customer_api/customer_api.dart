import 'package:starter_project/models/api_response.dart';
import 'package:starter_project/models/api_response_variants/get_salon_by_location_response.dart';

abstract class CustomerApi{
  Future<GetSalonByLocationResponse> getSalonByLocation({
    String latitude,
    String longitude,
  });

  Future<ApiResponse> getCustomerNotifications();
}