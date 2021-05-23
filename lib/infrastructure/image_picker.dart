import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickImage{
  static Future<File> selectImage() async{
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    final path = File(image.path);
    return path;
  }
}