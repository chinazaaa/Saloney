import 'package:flutter/cupertino.dart';

class TextController {
    static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController locationController = TextEditingController();
  static final formKey = new GlobalKey<FormState>();
  static final formSignInKey = new GlobalKey<FormState>();
}

// >>>>>>>>>>>>>> Valiadting and saving form
bool validateAndSave() {
  final form = TextController.formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}
// >>>>>>>>>>>>>> Valiadting and saving form
bool signInvalidateAndSave() {
  final form = TextController.formSignInKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}