import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/utils/closeSalons.dart';
import 'package:starter_project/Customer/pages/utils/buttons.dart';
//import 'package:starter_project/Customer/pages/utils/salonsImage.dart';
import 'package:starter_project/Customer/pages/utils/recommendationImage.dart';
import 'package:starter_project/Customer/pages/utils/textStyles.dart';
import 'package:starter_project/Customer/pages/utils/consts.dart';
import 'package:starter_project/Customer/pages/utils/imageContainer.dart';
import 'package:starter_project/core/repositories/customer_repository.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';
import 'package:starter_project/ui_helpers/widgets/error_retry_widget.dart';

import 'OverViewScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //get salons
      Provider.of<CustomerToSalonRepository>(context, listen: false).getSalonByLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CustomerToSalonRepository>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageContainer(),

            //Display all fetched salons
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Salons Near You", 20.0, kblack)),
                ),

                Expanded(
                  child: ResponsiveState(
                    state: model.state,
                    busyWidget: Center(child: Padding(padding: EdgeInsets.all(SizeConfig.widthOf(10)), child: CircularProgressIndicator(strokeWidth: 6, valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),),),),
                    errorWidget: Center(child: Padding(padding: EdgeInsets.all(SizeConfig.widthOf(10)), child: ErrorRetryWidget(errorMessage: model.error, onTap: ()=> model.getSalonByLocation(),),)),
                    idleWidget: Center(child: Padding(padding: EdgeInsets.all(SizeConfig.widthOf(10)), child: CircularProgressIndicator(strokeWidth: 6, valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),),),),
                    noDataAvailableWidget: Center(child: Padding(padding: EdgeInsets.all(SizeConfig.widthOf(10)), child: Text('No Salon Nearby', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),)),
                    dataFetchedWidget: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        ...model.salons.map((e) =>
                          buildContainer(description: e.description,
                            salonAddress: e.location.formattedAddress,
                            image: e.image.isNotEmpty? e.image[0] : null,
                            salonId: e.id,
                            salonName: e.nameOfSalon,
                          )
                        ).toList(),

                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer({String salonName, String salonAddress, String description, String image, String salonId}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return OverViewPage();
        }));
      },
      child: Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.only(bottom: 20),
        child: Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: image != null ? Image.network(image) :  Image.asset(
                        "assets/1.png",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BoldText(salonName ?? 'Unidentified', 20.5, kblack),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //BoldText("5 Stars", 15.0, korangelite),
                        Icon(
                          Icons.location_on,
                          color: kgreyDark,
                          size: 15.0,
                        ),
                        NormalText(salonAddress ?? "Unknown address", kgreyDark, 15.0)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: korange,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Icon(
                              //   Icons.star,
                              //   color: kwhite,
                              //   size: 15.0,
                              // ),
                              // BoldText("4.5", 15.0, kwhite)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // NormalText("(1024 Reviews)", kgreyDark, 11.0),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    BoldText(description ?? "No Description", 14.0, Colors.red),
                    SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 90,
                        ),
                        BoldText("More", 12.0, kblack),
                        Icon(
                          Icons.navigate_next,
                          size: 15.0,
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  Row imagesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SquaredIcon(Icons.airplanemode_active, "Flights"),
        SquaredIcon(FontAwesomeIcons.hotel, "Hotels"),
        SquaredIcon(Icons.directions_car, "Cars"),
      ],
    );
  }
}
