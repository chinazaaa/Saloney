import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/screens/service_provider.dart';
import 'package:starter_project/core/repositories/service_repository.dart';
import 'package:starter_project/ui_helpers/widgets/image_picker_ui_assets.dart';

import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/animation/FadeAnimation.dart';

import '../../../index.dart';

class AddNewService extends StatefulWidget {
  @override
  _AddNewServiceState createState() => _AddNewServiceState();
}

class _AddNewServiceState extends State<AddNewService> {
  // Controllers
  TextEditingController description = TextEditingController();
  TextEditingController nameOfService = TextEditingController();
  TextEditingController price = TextEditingController();

  List<String> _category = ['Hair', 'Makeup', 'Spa'];
  List<String> _isPublished = [
    'Yes',
    'No',
  ];
  String dropdownValue;
  String dropdownValue2;

  File _image;
  bool _track = false;

  // static const String id = 'addnewservice - screen';
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ServiceProvider>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Color(0xff9477cb),
        ),
        body: Form(
          child: Column(
            children: [
              Material(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: Row(
                            children: [
                              Text('Services / Add'),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveState(
                        state: model.state,
                        busyWidget: CircularProgressIndicator(),
                        idleWidget: InkWell(
                          onTap: () => addService(context),
                          child: FadeAnimation(
                            1.5,
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.purple),
                              icon: Icon(Icons.save, color: Colors.white),
                              label: Text(
                                'Save',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () => addService(context),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TabBar(
                indicatorColor: Color(0xff9477cb),
                labelColor: Color(0xff9477cb),
                unselectedLabelColor: Colors.black54,
                tabs: [
                  Tab(
                    text: 'GENERAL',
                  ),
                  Tab(text: 'INVENTORY'),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: TabBarView(
                      children: [
                        ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: nameOfService,
                                    decoration: InputDecoration(
                                        labelText: 'Name of Service',
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.grey[300],
                                        ))),
                                  ),
                                  TextFormField(
                                    controller: description,
                                    decoration: InputDecoration(
                                        labelText: 'Description',
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.grey[300],
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    children: [
                                      for (int i = 0;
                                          i <= model.productImages.length;
                                          i++)
                                        i == model.productImages.length
                                            ? AddImageButton(
                                                onTap: () =>
                                                    model.addProductImage(),
                                              )
                                            : ImageView(
                                                image: model.productImages[i],
                                                onTap: () =>
                                                    model.deleteProductImage(
                                                        index: i),
                                              ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: price,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: 'Price ',
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.grey[300],
                                        ))),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Category',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        DropdownButton<String>(
                                          hint: Text('Select Category'),
                                          value: dropdownValue,
                                          icon: Icon(Icons.arrow_drop_down),
                                          onChanged: (String value) {
                                            setState(() {
                                              dropdownValue = value;
                                            });
                                          },
                                          items: _category
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            SwitchListTile(
                              title: Text('Track Inventory'),
                              activeColor: Color(0xff9477cb),
                              subtitle: Text(
                                'Switch ON to track inventory',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              value: _track,
                              onChanged: (selected) {
                                setState(() {
                                  _track = selected;
                                });
                              },
                            ),
                            Visibility(
                                visible: _track,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Text('Availability',
                                        style: TextStyle(color: Colors.grey)),
                                    SizedBox(width: 50),
                                    DropdownButton<String>(
                                      hint: Text('Select Availability'),
                                      value: dropdownValue2,
                                      icon: Icon(Icons.arrow_drop_down),
                                      onChanged: (String value) {
                                        setState(() {
                                          dropdownValue2 = value;
                                        });
                                      },
                                      items: _isPublished
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ))
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addService(context) async {
    final model = Provider.of<ServiceRepo>(context, listen: false);

    // FIXME do we need this
    // if (!mykey.currentState.validate()) return;

    bool success = await model.addService(
      service: nameOfService.text, description: description.text, price: price.text,
      category: dropdownValue,
      // FIXME isPublished:dropdownValue2
    );
    if (success) {
      Get.snackbar(
        'Success',
        'Service Successfully Created. Please return to the Previous Page',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
      // FIXME Go where now??
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
    }
    // else {
    //   //Do nothing
    //   Get.snackbar(
    //     'Error',
    //     'Something terrible has gone wrong. Please contact support',
    //     margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
    //     snackStyle: SnackStyle.FLOATING,
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.black26,
    //   );
    // }
  }
}
