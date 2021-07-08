import 'dart:async';
import 'dart:io';

import 'package:starter_project/index.dart';

abstract class DashboardApi {
  //Future<ApiResponse> getUserProfile({String token});

  Future<ApiResponse> salondashboard({
    String salonId,
   
  });
}
