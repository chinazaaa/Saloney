import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/screens/salonServices.dart';
import 'package:starter_project/Customer/pages/utils/Buttons.dart';
import 'package:starter_project/Customer/pages/utils/TextStyles.dart';
import 'package:starter_project/Customer/pages/utils/consts.dart';
import 'package:starter_project/core/repositories/customer_repository.dart';
import 'package:provider/provider.dart';

class OverViewPage extends StatefulWidget {
  @override
  _OverViewPageState createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
   final models = Provider.of<CustomerToSalonRepository>(context);
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: Stack(
        children: <Widget>[
                    // ...models.salons
                    //   .map((e) => buildContainer(
                    //         description: e.description,
                    //         salonAddress: e.location.formattedAddress,
                    //         image: e.avatar,
                    //         salonId: e.id,
                    //         salonName: e.nameOfSalon,
                    //         gallery: e.image
                    //       ))
                    //   .toList(),
          Positioned(
            top: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/1.png")),
          ),
          Positioned(
            top: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Scaffold(
                  appBar: TabBar(
                    labelColor: kdarkBlue,
                    labelStyle: TextStyle(
                        fontFamily: "nunito", fontWeight: FontWeight.bold),
                    controller: tabController,
                    indicatorColor: kdarkBlue,
                    tabs: <Widget>[
                      Tab(text: "OverView"),
                      Tab(text: "Location"),
                      Tab(text: "Gallery"),
                    ],
                  ),
                  backgroundColor: kwhite,
                  body: Stack(
                    children: <Widget>[
                      TabBarView(
                        children: <Widget>[
                
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                BoldText("Plaza", 20.5,kblack),
                                Row(
                                  children: <Widget>[
                                    //BoldText("4.5 Stars", 12.0, korange),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: kgreyDark,
                                      size: 15.0,
                                    ),
                                    NormalText("Lekki", kgreyDark, 15.0),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // NormalText( //description of salon goes here
                                //     "Cheap and affordable", kgreyDark, 16.0),
                                // SizedBox(
                                //   height: 10.0,
                                // ),
                                Container(
                                  height: 2,
                                  color: kgreyFill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    BoldText("About this salon", 20.0, kblack),
                                    // BoldText("More", 16, kdarkBlue)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                NormalText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. ",
                                    kblack,
                                    12.0),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 2,
                                  color: kgreyFill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    BoldText("categories", 20.0, kblack),
                                    // BoldText("More", 16, kdarkBlue),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //categories go here
                                    equipmentsItem(Icons.wifi, "Beauty"),
                                    equipmentsItem(
                                        Icons.local_parking, "Hair"),
                                    equipmentsItem(Icons.face, "Spa"),
                                    // equipmentsItem(
                                    //     Icons.restaurant, "Restaurant"),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BoldText("Location", 20.0, kblack),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      "assets/plazamap.png",
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              90,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BoldText("Gallery", 20.0, kblack),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      "assets/1.png",
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              90,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                            ),
                     
                        ],
                        controller: tabController,
                      ),
                    ],
                  ),

                  /*Stack(
                    children: <Widget>[
                      Image.asset("assets/hotel.jpg"),
                    ],
                  ),*/
                ),
              ),
            ),
          ),
          Positioned(
              top: 580,
              left: 5,
              child: WideButton(
                "BOOK NOW",
                () {
                       Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SalonServicesScreen()));
                },
              )),
        ],
      ),
    );
  }
  // Widget buildContainer(
  //     {String salonName,
  //     String salonAddress,
  //     String description,
  //     String image,
  //     String salonId,
  //     String category,
  //     String gallery,
  //     }) 


  Column equipmentsItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          icon,
          color: kdarkBlue,
        ),
        NormalText(text, kdarkBlue, 12)
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}


