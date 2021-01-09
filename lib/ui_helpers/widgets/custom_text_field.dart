import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  Widget trailing;
  Widget leading;
  Color fillColor;
  AutovalidateMode autovalidateMode;
  Function validator;
  TextInputType keyboardType;

  CustomTextField(
      {this.hintText = 'First Name',
      this.autovalidateMode = AutovalidateMode.disabled,
      this.validator,
      this.trailing,
      this.leading,
      this.keyboardType,
      this.controller,
      this.fillColor = Colors.transparent});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        autovalidateMode: autovalidateMode,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).hintColor,
                )),
            contentPadding: EdgeInsets.all(16),
            hintText: hintText,
            filled: true,
            fillColor: fillColor,
            suffixIcon: trailing,
            prefixIcon: leading),
      ),
    );
  }
}
