import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
class ServiceProvider with ChangeNotifier{

File image;
String pickerError = '';

Future<File> getServiceImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 20);
  if (pickedFile != null) {
    this.image = File(pickedFile.path);
    notifyListeners();
  } else {
    this.pickerError = 'No image selected';
    print('No image selected.');
    notifyListeners();
  }
  return this.image;
}
}