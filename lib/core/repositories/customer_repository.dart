import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/customer_api/customer_api.dart';
import 'package:starter_project/core/services/map_service.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/api_response_variants/get_salon_by_location_response.dart';

import '../../locator.dart';

class CustomerRepository extends BaseNotifier{

}

class CustomerToSalonRepository extends BaseNotifier{

  //Api
  final customerApi = locator<CustomerApi>();

  Future<Position> fetchUserLocation() async {
    final ms = locator<MapService>();
    if(ms.deviceLocation != null) return ms.deviceLocation;
    var p = await ms.getDeviceLocation();
    return p;
  }

  List<SalonLocation> salons = [];
  Future getSalonByLocation() async{
    //get user location
    Position p = await fetchUserLocation();
    if(p == null){
      setError('Could not get User location');
      return;
    }

    if(salons.isEmpty) setState(ViewState.Busy);
    try {
      GetSalonByLocationResponse res = await customerApi.getSalonByLocation(latitude: p.latitude.toString(), longitude: p.longitude.toString());
      if(res.salonLocation.isEmpty){
        setState(ViewState.NoDataAvailable);
        return;
      }
      salons = res.salonLocation;
      setState(ViewState.DataFetched);
      return;
    } on NetworkException {
      setError('No Internet Connection');
    }
    catch (e) {
      setError(e.toString());
    }
    return false;
  }
}