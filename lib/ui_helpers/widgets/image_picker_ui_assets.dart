import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  File image;
  Function onTap;
  ImageView({this.image, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              color: Colors.grey[100],
              child: image == null
                  ? Text("No Image")
                  : Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 93, height: 93, child: Container(
              color: Colors.black.withOpacity(.4),
              child: Center(child: Icon(Icons.close, color: Colors.white,),)))
        ],
      ),
    );
  }
}

class AddImageButton extends StatelessWidget {
  Function onTap;
  AddImageButton({
    Key key, this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Card(
          color: Colors.grey[100],
          child: Center(
              child: Icon(Icons.add)),
        ),
      ),
    );
  }
}
