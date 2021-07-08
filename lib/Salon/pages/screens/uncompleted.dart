// import 'package:flutter/material.dart';

// class SalonUncompletedOrders extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: FittedBox(
//         child: DataTable(
//             showBottomBorder: true,
//             dataRowHeight: 60,
//             headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
//             columns: <DataColumn>[
//               DataColumn(
//                 label: Text('Customer'),
//               ),
//                DataColumn(
//                 label: Text('Phone No.'),
//               ),
//               DataColumn(
//                 label: Text('Services'),
//               ),
//               DataColumn(
//                 label: Text('Booking Date'),
//               ),
//               DataColumn(
//                 label: Text('Actions'),
//                  ),
//             ],
//             rows: [
//               DataRow(cells: [
//                  DataCell(Text('Naza')),
//                   DataCell(Text('08024771835')),
//                 DataCell(Text('Hair')),
//                  DataCell(Text('Tuesday 20th November, 2021')),
//                 DataCell(
//                   PopupOptionMenu(),
//                 )
//               ]),
//               DataRow(cells: [
//                  DataCell(Text('Naza')),
//                 DataCell(Text('08024771835')),
//                 DataCell(Text('Cruise')),
//                 DataCell(Text('Cruise')),
//                 DataCell(Text('Cruise'))
//               ]),
//               DataRow(cells: [
//                  DataCell(Text('Naza')),
//                 DataCell(Text('08024771835')),
//                 DataCell(Text('Cruise')),
//                 DataCell(Text('Cruise')),
//                 DataCell(Text('Cruise'))
//               ])
//             ]),
//       ),
//           );
//   }
// }
// enum MenuOption {Complete}
// class PopupOptionMenu extends StatelessWidget {
//   const PopupOptionMenu({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<MenuOption>(
//       itemBuilder: (BuildContext context) {
//         return <PopupMenuEntry<MenuOption>>[
//           PopupMenuItem(
//             // child: Icon(Icons.done, color: Colors.black, size: 28.0),
//             child: Text("Complete"),
//           value: MenuOption.Complete,
//           ),
//           //   PopupMenuItem(
//           //       child: Icon(Icons.cancel, color: Colors.black, size: 28.0),
//           //     //child: Text("Publish"),
//           // value: MenuOption.Unpublish,
//           // ),
//           //   PopupMenuItem(
//           //       child: Icon(Icons.delete,color: Colors.black, size: 28.0),
//           //     //child: Text("Delete"),
//           // value: MenuOption.Delete,
//           //    )
//         ];
//       },
//     );
//   }
// }


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/screens/edit_service.dart';
//import 'package:starter_project/Salon/pages/screens/published_service.dart';
import 'package:starter_project/Salon/pages/screens/service.dart';
import 'package:starter_project/core/repositories/bookings_repository.dart';
import 'package:starter_project/core/repositories/service_repository.dart';
import 'package:starter_project/infrastructure/user_info_cache.dart';
import 'package:starter_project/locator.dart';
import 'package:starter_project/models/api_response_variants/bookings_response.dart';
import 'package:starter_project/models/service/get_unpublished_service_reponse.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';
import 'package:starter_project/ui_helpers/widgets/error_retry_widget.dart';

class SalonUncompletedOrders extends StatefulWidget {
  @override
  _SalonUncompletedOrdersState createState() => _SalonUncompletedOrdersState();
}

class _SalonUncompletedOrdersState extends State<SalonUncompletedOrders> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BookingRepo>(context, listen: false).getSalonUnCompletedBookings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BookingRepo>(context);
    return ResponsiveState(
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
        child: ErrorRetryWidget(
          errorMessage: model.error,
          onTap: () => model.getSalonUnCompletedBookings,
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
            'No Uncompleted orders',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      dataFetchedWidget: SingleChildScrollView(
        child: DataTable(
            showBottomBorder: true,
            dataRowHeight: 60,
            headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
            columns: <DataColumn>[
              DataColumn(
                label: Text('Customer'),
              ),
               DataColumn(
                label: Text('Phone No.'),
              ),
              DataColumn(
                label: Text('Services'),
              ),
              DataColumn(
                label: Text('Booking Date'),
              ),
              DataColumn(
                label: Text('Actions'),
                 ),
            ],
            rows: [
              ...model.salonUncompletedOrders
                  .map(
                    (e) => DataRow(cells: [
              DataCell(Text(locator<UserInfoCache>().customer.data.userName)),
                       DataCell(Text(locator<UserInfoCache>().customer.data.phone.toString())),
                            DataCell(Text(e.services.join(", "))),
                            DataCell(Text(e.bookingDate)),
                      DataCell(
                        PopupOptionMenu(e),
                      )
                    ]),
                  )
                  .toList(),
            ]),
      ),
    );
  }
}

enum MenuOption { Complete }

class PopupOptionMenu extends StatelessWidget {
  final Booking data;
  const PopupOptionMenu(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final models = Provider.of<BookingRepo>(context);
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
            child: ListTile(
             
                title: Text("Complete")),
            value: MenuOption.Complete,
          ),
          
        ];
      },
    );
  }
}
