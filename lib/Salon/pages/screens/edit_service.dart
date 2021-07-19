import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'service_provider.dart';
import '../../../core/repositories/service_repository.dart';
import '../../../models/service/get_unpublished_service_reponse.dart';
import '../../../models/service/salon_service.dart';
import '../../../ui_helpers/widgets/image_picker_ui_assets.dart';

import '../../../ui_helpers/responsive_state/responsive_state.dart';
import '../../../ui_helpers/animation/FadeAnimation.dart';

import '../../../index.dart';

class EditService extends StatefulWidget {
  final SalonService service;

  EditService({this.service});

  @override
  _EditServiceState createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
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

  final serviceKey = GlobalKey<FormState>();

  @override
  void initState() {
    description.text = widget.service.description ?? '';
    nameOfService.text = widget.service.service ?? '';
    price.text = widget.service.price ?? '';
    dropdownValue = widget.service.category ?? null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.service.image);
    final model = Provider.of<ServiceProvider>(context, listen: false);
    final repo = Provider.of<ServiceRepo>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Color(0xff9477cb),
        ),
        body: Form(
          key: serviceKey,
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
                              Text('Services / Edit'),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveState(
                        state: repo.state,
                        busyWidget: CircularProgressIndicator(),
                        idleWidget: FadeAnimation(
                          1.5,
                          TextButton.icon(
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xff9477cb)),
                            icon: Icon(Icons.save, color: Colors.white),
                            label: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (!serviceKey.currentState.validate()) return;
                              updateService(context);
                            },
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
                                    validator: (value) =>
                                        model.validateName(value),
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
                                    validator: (value) =>
                                        model.validateName(value),
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
                                  widget.service.image == null
                                      ? AddImageButton(
                                          onTap: () async {
                                            _image = await model.getImage();
                                            setState(() {});
                                          },
                                        )
                                      : NetworkImageView(
                                          imageUrl: widget.service.image,
                                          onTap: () {
                                            setState(() {
                                              _image = null;
                                            });
                                          },
                                        ),
                                  TextFormField(
                                    controller: price,
                                    validator: (value) =>
                                        int.tryParse(value) == null
                                            ? 'Enter a valid figure'
                                            : null,
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
                                        Expanded(
                                          child:
                                              DropdownButtonFormField<String>(
                                            hint: Text('Select Category'),
                                            validator: (val) => val == null
                                                ? 'Select a category'
                                                : null,
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

  updateService(context) async {
    final model = Provider.of<ServiceRepo>(context, listen: false);

    bool success = await model.updateService(
        service: nameOfService.text,
        description: description.text,
        price: price.text,
        category: dropdownValue,
        image: _image == null ? null : _image.path,
        serviceId: widget.service.id);
    if (success) {
      Navigator.pop(context);
      Get.snackbar(
        'Success',
        'Service Successfully Updated',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
  }
}
