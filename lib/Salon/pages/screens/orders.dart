import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/utils/TextStyles.dart';
import 'package:starter_project/Customer/pages/utils/consts.dart';
import 'package:starter_project/Salon/pages/screens/completed.dart';
import 'package:starter_project/Salon/pages/screens/uncompleted.dart';

class SalonOrders extends StatefulWidget {
  @override
  _SalonOrdersState createState() => _SalonOrdersState();
}

class _SalonOrdersState extends State<SalonOrders> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        brightness: Brightness.light,
        title: BoldText("My Orders", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
         leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
      ),
      body: Scaffold(
        backgroundColor: kwhite,
        appBar: TabBar(
          labelColor: kdarkBlue,
          labelStyle:
              TextStyle(fontFamily: "nunito", fontWeight: FontWeight.bold),
          controller: tabController,
          indicatorColor: kdarkBlue,
          tabs: <Widget>[
            Tab(text: "Uncompleted"),
            Tab(text: "Completed"),
            // Tab(text: "Approved"),
          
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            //Icon(Icons.person),
            // SingleChildScrollView(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[


            //       ],
            //     ),
            //   ),
            // ),
           
            SalonUncompletedOrders(),
            SalonCompletedOrders()
           
          ],
          controller: tabController,
        ),
      ),
    );
  }
}