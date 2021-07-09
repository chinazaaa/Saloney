import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/screens/completed_orders.dart';
import 'package:starter_project/Customer/pages/screens/uncompleted_orders.dart';
import 'package:starter_project/Customer/pages/utils/RecommendationImage.dart';
import 'package:starter_project/Customer/pages/utils/TextStyles.dart';
import 'package:starter_project/Customer/pages/utils/consts.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
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
           // Tab(text: "Orders"),
            Tab(text: "Uncompleted"),
            Tab(text: "Completed"),
          
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
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             BoldText("Current order", 20.0, kblack),
            //             BoldText("More", 16, kdarkBlue),
            //           ],
            //         ),
            //         SizedBox(height: 16,),
            //         Container(
            //           width: MediaQuery.of(context).size.width-80,
            //           height: 250,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: <Widget>[
            //               Container(
            //                 width:MediaQuery.of(context).size.width-80,
            //                 height: 200.0,
            //                 child: ClipRRect(
            //                     borderRadius: new BorderRadius.all(
            //                       Radius.circular(15),
            //                     ),
            //                     child: Image.asset(
            //                       "assets/2.png",
            //                       fit: BoxFit.fitHeight,
            //                     )),
            //               ),
            //               BoldText("Naza", 20.0, kblack),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: <Widget>[
            //                   NormalText("Lekki", kgreyDark, 12.0),
            //                   Icon(
            //                     Icons.location_on,
            //                     color: kgreyDark,
            //                     size: 16.0,
            //                   )
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //         SizedBox(height: 10.0,),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             BoldText("Past order", 20.0, kblack),
            //             BoldText("More", 16, kdarkBlue),
            //           ],
            //         ),
            //         SizedBox(height: 10.0,),
            //         Container(
            //           width: 400,
            //           height: 200,
            //           child: ListView(
            //             scrollDirection: Axis.horizontal,
            //             children: <Widget>[
            //               RecommendationImage("assets/1.png", "Naza", "Nigeria"),
            //               RecommendationImage("assets/2.png", "Sudu", "Nigeria"),
            //               RecommendationImage("assets/3.png", "KC", "Nigeria"),
            //             ],
            //           ),
            //         ),

            //       ],
            //     ),
            //   ),
            // ),
            CustomerUncompletedOrders(),
            CustomerCompletedOrders()
          ],
          controller: tabController,
        ),
      ),
    );
  }
}