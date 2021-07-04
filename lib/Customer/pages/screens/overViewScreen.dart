import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/screens/salonServices.dart';
import 'package:starter_project/Customer/pages/utils/Buttons.dart';
import 'package:starter_project/Customer/pages/utils/TextStyles.dart';
import 'package:starter_project/Customer/pages/utils/consts.dart';
import 'package:starter_project/core/repositories/customer_repository.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/models/api_response_variants/salon_login_response.dart';

class OverViewPage extends StatefulWidget {
  final String salonName;
  final String salonAddress;
  final String description;
  final String avatar;
  final List<String> gallery;
  final Location location;
  final String ownerName;
  final String salonId;
  final String categories;

  const OverViewPage(
      {Key key,
      this.salonName,
      this.salonAddress,
      this.description,
      this.avatar,
      this.gallery,
      this.location,
      this.ownerName,
      this.salonId,
      this.categories})
      : super(key: key);
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
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: widget.avatar != null
                    ? Image.network(widget.avatar)
                    : Image.asset("assets/1.png")),
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
                      // Tab(text: "Location"),
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
                                BoldText(widget.salonName ?? 'Unidentified',
                                    20.5, kblack),
                                Row(
                                  children: <Widget>[
                                    //BoldText("4.5 Stars", 12.0, korange),
                                    // SizedBox(
                                    //   width: 16.0,
                                    // ),
                                    Icon(
                                      Icons.location_on,
                                      color: kgreyDark,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: NormalText(
                                            widget.salonAddress ??
                                                "Unknown location",
                                            kgreyDark,
                                            15.0)),
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
                                    widget.description ?? 'No description',
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
                                equipmentsItem(Icons.category,
                                    widget.categories ?? 'No category'),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: Container(
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: <Widget>[
                          //         BoldText("Location", 20.0, kblack),
                          //         ClipRRect(
                          //           borderRadius: BorderRadius.circular(20.0),
                          //           child: Image.asset(
                          //             "assets/plazamap.png",
                          //             fit: BoxFit.fill,
                          //             height:
                          //                 MediaQuery.of(context).size.width -
                          //                     90,
                          //             width: MediaQuery.of(context).size.width,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    BoldText("Gallery", 20.0, kblack),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      runSpacing: 10,
                                      spacing: 10,
                                      children: [
                                        ...widget.gallery
                                            .map(
                                              (e) => Container(
                                                height: 150,
                                                width: 150,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Image.network(
                                                    e,
                                                    fit: BoxFit.fill,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            90,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ],
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
                      builder: (context) => SalonServicesScreen(
                        widget.salonId,
                        widget.salonName,
                        widget.description,
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }

  Row equipmentsItem(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: kdarkBlue,
        ),
        SizedBox(
          width: 10,
        ),
        NormalText(text, kdarkBlue, 12)
      ],
    );
  }

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
}
