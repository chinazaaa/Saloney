import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/screens/service_provider.dart';

class AddNewService extends StatefulWidget {
  @override
  _AddNewServiceState createState() => _AddNewServiceState();
}
  class _AddNewServiceState extends State<AddNewService> {

  List<String> _category =[
    'Hair',
    'Makeup',
    'Spa'
  ];
  String dropdownValue;
  File _image;

  // static const String id = 'addnewservice - screen';
  @override
  Widget build(BuildContext context) {
      var _provider = Provider.of<ServiceProvider>(context);
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
                      icon: Icon(Icons.save, color:Colors.white),
                      label: Text('Save', style: TextStyle(color: Colors.white),),
                      onPressed: (){},
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
                        Tab(text: 'General',),
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
                                  labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey[300],))
                                 ),
                              ),
                               TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey[300],))
                                 ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    _provider.getServiceImage().then((image){
                                         setState(() {
                                        _image = image;                                      
                                                                            });
                                    });
                                  },
                                  child: SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Card(
                                      child: Center(child: _image==null ? Text('Select Image') : Image.file(_image)),
                                    ),
                                  ),
                                ),
                              ),
                               TextFormField(
                                 keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Price ',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey[300],))
                                 ),
                              ),
                              Container(
                                child: Row(children: [
                                  Text('Category', style: TextStyle(color: Colors.grey),),
                                  SizedBox(width: 10,),
                                  DropdownButton<String>(
                                    hint: Text('Select Category'),
                                    value: dropdownValue,
                                    icon: Icon(Icons.arrow_drop_down),
                                    onChanged: (String value) {
                                    
                                      setState(() {
                                      dropdownValue = value;
                                      });
                                    },
                                    items: _category.map<DropdownMenuItem<String>>((String value) {
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
                      
                                 Text('Coming Soon',textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        ),
                      )
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