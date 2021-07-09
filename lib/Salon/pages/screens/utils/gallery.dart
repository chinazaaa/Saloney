import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';

class AddGallery extends StatefulWidget {
  @override
  _AddGalleryState createState() => _AddGalleryState();
}

class _AddGalleryState extends State<AddGallery> {
  List _images = [];
  File imagefile;
  final picker = ImagePicker();

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: _images.length + 1,
              itemBuilder: (BuildContext context, index) {
                return index == _images.length
                    ? Container(
                        child: GestureDetector(
                          onTap: () {
                            chooseImage();
                          },
                          child: DottedBorder(
                            color: Colors.grey,
                            strokeWidth: 2,
                            radius: Radius.circular(8),
                            dashPattern: [8, 4],
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            image: DecorationImage(
                                image: FileImage(_images[index]),
                                fit: BoxFit.cover)),
                      );
              },
              staggeredTileBuilder: (int index) => new StaggeredTile.count(
                  index == 0 ? 2 : 1, index == 0 ? 2 : 1),
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ))
            );
  }
}
