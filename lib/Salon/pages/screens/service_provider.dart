import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ServiceProvider with ChangeNotifier {
  //List of images
  List<File> images = <File>[];
  String pickerError = '';

  Future<File> getServiceImage() async {
    File image;
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      images.add(image);

      notifyListeners();
    } else {
      this.pickerError = 'No image selected';
      print('No image selected.');
      notifyListeners();
    }
    return image;
  }

  bool deleteImage({int index}){
    images.removeAt(index);
    notifyListeners();
  }
}
