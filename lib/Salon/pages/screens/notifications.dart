import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/screens/orders.dart';
import 'package:starter_project/Salon/pages/screens/utils/app_properties.dart';
// import 'package:ecommerce_int2/screens/rating/rating_page.dart';
// import 'package:ecommerce_int2/screens/tracking_page.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/core/repositories/bookings_repository.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BookingRepo>(context, listen: false)
          .getSalonUnCompletedBookings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BookingRepo>(context);
    return Material(
      color: Colors.grey[100],
      child: SafeArea(
        child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Notification',
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CloseButton()
                ],
              ),
              Flexible(
                child: ResponsiveState(
                  state: model.state,
                  busyWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.widthOf(10)),
                      child: CircularProgressIndicator(
                        strokeWidth: 6,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  errorWidget: Center(
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.widthOf(10)),
                        child: Text(
                          'An error occured'
                        ),
                      )),
                  idleWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.widthOf(10)),
                      child: CircularProgressIndicator(
                        strokeWidth: 6,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  noDataAvailableWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.widthOf(10)),
                      child: Text(
                        'No new notifications',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  dataFetchedWidget: ListView(
                    children: <Widget>[

                      ...model.salonUncompletedOrders.map((e) =>
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                        'assets/1.png',
                                      ),
                                      maxRadius: 24,
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: e.customerName,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    )),
                                                TextSpan(
                                                  text: ' wants to ',
                                                ),
                                                TextSpan(
                                                  text: e.serviceName.join(", "),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.check_circle,
                                          size: 14,
                                          color: Colors.blue[700],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text('Accept',
                                              style:
                                              TextStyle(color: Colors.blue[700])),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.cancel,
                                          size: 14,
                                          color: Color(0xffF94D4D),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text('Decline',
                                              style: TextStyle(
                                                  color: Color(0xffF94D4D))),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                      ).toList(),

                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 4.0),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.stretch,
                      //     children: <Widget>[
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Row(children: [
                      //           SizedBox(
                      //             height: 110,
                      //             width: 110,
                      //             child: Stack(children: <Widget>[
                      //               Positioned(
                      //                 left: 5.0,
                      //                 bottom: -10.0,
                      //                 child: SizedBox(
                      //                   height: 100,
                      //                   width: 100,
                      //                   child: Transform.scale(
                      //                     scale: 1.2,
                      //                     child: Image.asset(
                      //                         'assets/3.png'),
                      //                   ),
                      //                 ),
                      //               ),
                      //               // Positioned(
                      //               //   top: 8.0,
                      //               //   left: 10.0,
                      //               //   child: SizedBox(
                      //               //       height: 80,
                      //               //       width: 80,
                      //               //       child: Image.asset(
                      //               //           'assets/4.png')),
                      //               // )
                      //             ]),
                      //           ),
                      //           Flexible(
                      //             child: Column(children: [
                      //               Text(
                      //                   'Washing of hair',
                      //                   style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       fontSize: 10)),
                      //               SizedBox(height:4.0),
                      //               Text(
                      //                   'You have successfully received this order',
                      //                   style: TextStyle(
                      //                       color: Colors.grey, fontSize: 10))
                      //             ]),
                      //           )
                      //         ]),
                      //       ),
                      //       InkWell(
                      //         onTap: () => Navigator.of(context).push(
                      //             MaterialPageRoute(
                      //                 builder: (_) => Orders()
                      //                 )
                      //                 ),
                      //         child: Container(
                      //             padding: const EdgeInsets.all(14.0),
                      //             decoration: BoxDecoration(
                      //                 color: purple,
                      //                 borderRadius: BorderRadius.only(
                      //                     bottomRight: Radius.circular(5.0),
                      //                     bottomLeft: Radius.circular(5.0))),
                      //             child: Align(
                      //                 alignment: Alignment.centerRight,
                      //                 child: Center(
                      //                 child: Text(
                      //                   'Congrats on your order!',
                      //                   style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontWeight: FontWeight.bold,
                      //                       fontSize: 20),
                      //                 ))),
                      //       ))
                      //     ],
                      //   ),
                      // ),

                    ],
                  ),
                ),
              )
            ])),
      ),
    );
  }
}