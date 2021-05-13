import 'dart:io';
import 'dart:async';
// import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starter_project/ui_helpers/responsive_state/base_view_model.dart';

class ServiceProvider extends BaseNotifier {
  //List of images
  List<File> productImages = <File>[];
  List<File> salonProfileImages = <File>[];
  String pickerError = '';

  Future<File> addProductImage() async {
    File image;
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      productImages.add(image);

      notifyListeners();
    } else {
      this.pickerError = 'No image selected';
      print('No image selected.');
      notifyListeners();
    }
    return image;
  }

  bool deleteProductImage({int index}) {
    productImages.removeAt(index);
    notifyListeners();
    return true;
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
}
