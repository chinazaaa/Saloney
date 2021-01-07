import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/screens/notifications.dart';
import 'package:starter_project/Customer/pages/utils/service.dart';
import 'package:starter_project/Customer/pages/screens/widgets/badge.dart';
import 'package:starter_project/Customer/pages/screens/widgets/grid_service.dart';


class SalonsScreen extends StatefulWidget {
  @override
  _SalonsScreenState createState() => _SalonsScreenState();
}

class _SalonsScreenState extends State<SalonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Salon Services",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),

      body: Padding(
          padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(

          children: <Widget>[
            Text(
              "Chinese",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                Map service = services[index];
                return GridService(
                  img: service['img'],
                  isFav: false,
                  name: service['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),

            SizedBox(height: 20.0),
            Text(
              "Italian",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                Map service = services[index];
                return GridService(
                  img: service['img'],
                  isFav: false,
                  name: service['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),

            SizedBox(height: 20.0),
            Text(
              "African",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                Map food = services[index];
                return GridService(
                  img: food['img'],
                  isFav: false,
                  name: food['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}