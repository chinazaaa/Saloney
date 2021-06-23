import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:starter_project/core/services/app_keys.dart';

class MapService{
  Position _deviceLocation;
  GeocodingResult _deviceLocationDetails;

  Position get deviceLocation => _deviceLocation;
  GeocodingResult get deviceLocationDetails => _deviceLocationDetails;

  final GEOCODER = GoogleMapsGeocoding(apiKey: AppConstants.mapKey);

  Future<Position> getDeviceLocation() async {
    Position position =
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _deviceLocation = position;

    if(position != null){
      try{
        _deviceLocationDetails = await getLocationDetails();
      } catch(e){
        print('Could not get device location details');
      }
    }
    return position;
  }

  Future<GeocodingResult> getLocationDetails({Location location}) async{
    if(location == null){
      ///if location param is null, return _devicelocation details
      ///return null if device location is null
      if(_deviceLocation == null) return null;
      GeocodingResponse detail = await GEOCODER.searchByLocation(Location(
          lat: _deviceLocation.latitude, lng: _deviceLocation.longitude));
      _deviceLocationDetails = detail.results[0];
      return detail.results[0];
    } else{
      GeocodingResponse detail = await GEOCODER.searchByLocation(location);
      return detail.results[0];
    }
  }

  Future<Uint8List> getBytesFromAssetForMap(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  Future<bool> checkDeviceLocationPermissions() async{
    bool serviceEnabled = false;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    return serviceEnabled;
  }
}