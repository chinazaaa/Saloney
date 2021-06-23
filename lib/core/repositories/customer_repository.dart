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

  String currentAction = 'loading...';

  updateCurrentAction(String s){
    currentAction = s;
    notifyListeners();
  }

  Future<Position> fetchUserLocation() async {
    final ms = locator<MapService>();
    if(ms.deviceLocation != null) return ms.deviceLocation;
    var p = await ms.getDeviceLocation();
    // print(ms.deviceLocationDetails.formattedAddress);
    return p;
  }

  List<SalonLocation> salons = [];
  Future getSalonByLocation() async{
    updateCurrentAction('Fetching your location...');
    //get user location
    Position p = await fetchUserLocation();
    if(p == null){
      setError('Could not get User location');
      return;
    }
    // print('long: ' + p.longitude.toString());
    // print('lat: ' + p.latitude.toString());

    if(salons.isEmpty) setState(ViewState.Busy);
    try {
      updateCurrentAction('Fetching salons near you...');
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
    updateCurrentAction('...');
    return false;
  }
}