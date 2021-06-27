import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/screens/notifications.dart';
import 'package:starter_project/Customer/pages/utils/service.dart';
import 'package:starter_project/Customer/pages/screens/widgets/badge.dart';
import 'package:starter_project/Customer/pages/screens/widgets/grid_service.dart';
import 'package:starter_project/core/repositories/customer_repository.dart';

class SalonServicesScreen extends StatefulWidget {
  final String salonId, salonName, description;
  const SalonServicesScreen(this.salonId, this.salonName, this.description);
  @override
  _SalonServicesScreenState createState() => _SalonServicesScreenState();
}

class _SalonServicesScreenState extends State<SalonServicesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //Load services using salon id
      Provider.of<CustomerToSalonRepository>(context, listen: false)
          .getSalonServices(widget.salonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CustomerToSalonRepository>(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xff9477cb),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Salon Services for ${widget.salonName}",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              //color: Color(0xff9477cb),
              size: 22.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return CustomerNotifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Divider(),
            Text(
              "Hair",
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
                  // isFav: false,
                  name: service['name'],
                  // rating: 5.0,
                  price: service['price'],
                );
              },
            ),
            SizedBox(height: 20.0),
            Text(
              "Beauty",
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
                  //isFav: false,
                  name: service['name'],
                  // rating: 5.0,
                  price: service['price'],
                );
              },
            ),
            SizedBox(height: 20.0),
            Text(
              "Spa",
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
                  // isFav: false,
                  name: food['name'],
                  // rating: 5.0,
                  price: food['price'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
