import 'package:flutter/material.dart';
import 'package:starter_project/Salon/pages/screens/add_newservice.dart';
import 'package:starter_project/Salon/pages/screens/published_service.dart';
import 'package:starter_project/Salon/pages/screens/unpublished_service.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
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
                            Text('Services',
                            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                            SizedBox(
                              width: 10,
                            ),
                            // CircleAvatar(
                            //   backgroundColor: Colors.black54,
                            //   maxRadius: 8,
                            //   child: FittedBox(
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(6.0),
                            //       child: Text('20',
                            //           style: TextStyle(
                            //               color: Colors.white,
                            //               fontWeight: FontWeight.bold)),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                    FlatButton.icon(
                      color: Color(0xff9477cb),
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'Add New',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewService()));
                      },
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
                  text: 'UNPUBLISHED',
                ),
                Tab(
                  text: 'PUBLISHED',
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [UnPublishedService(), PublishedServiceScreen(), ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
