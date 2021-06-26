import 'dart:io';
import 'dart:async';
// import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/services_api/services_api.dart';
import 'package:starter_project/core/mixin/validators.dart';
import 'package:starter_project/models/api_response.dart';
import 'package:starter_project/ui_helpers/responsive_state/base_view_model.dart';
import 'package:starter_project/ui_helpers/responsive_state/view_state.dart';

import '../../../locator.dart';

class ServiceProvider extends BaseNotifier with Validators{
  //List of images
  List<File> salonProfileImages = <File>[];
  String pickerError = '';

  Future<File> getImage() async {
    File image;
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    } else {
      this.pickerError = 'No image selected';
      print('No image selected.');
      notifyListeners();
    }
    return image;
  }

  Future<File> addSaloonProfileImage() async {
    File image;
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      salonProfileImages.add(image);

      notifyListeners();
    } else {
      this.pickerError = 'No image selected';
      print('No image selected.');
      notifyListeners();
    }
    return image;
  }

  bool deleteSaloonProfileImage({int index}) {
    salonProfileImages.removeAt(index);
    notifyListeners();
    return true;
  }

  //Api Requests
  final serviceApi = locator<ServicesApi>();
}
