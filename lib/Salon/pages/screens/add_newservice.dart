import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/screens/service_provider.dart';
import 'package:starter_project/ui_helpers/widgets/image_picker_ui_assets.dart';

class AddNewService extends StatefulWidget {
  @override
  _AddNewServiceState createState() => _AddNewServiceState();
}

class _AddNewServiceState extends State<AddNewService> {
  List<String> _category = ['Hair', 'Makeup', 'Spa'];
  List<String> _availability = [
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
    final model = Provider.of<ServiceProvider>(context);
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
                              Text('Products / Add'),
                            ],
                          ),
                        ),
                      ),
                      FlatButton.icon(
                        color: Color(0xff9477cb),
                        icon: Icon(Icons.save, color: Colors.white),
                        label: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
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
                                          i <= model.images.length;
                                          i++)
                                        i == model.images.length
                                            ? AddImageButton(onTap: ()=> model.getServiceImage(),)
                                            : ImageView(image: model.images[i], onTap: ()=>model.deleteImage(index: i),),
                                    ],
                                  ),
                                  TextFormField(
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
                                      items: _availability
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

