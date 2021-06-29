// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:starter_project/Customer/pages/screens/orders.dart';
// import 'package:starter_project/Salon/pages/screens/edit_service.dart';
// //import 'package:starter_project/Salon/pages/screens/published_service.dart';
// import 'package:starter_project/Salon/pages/screens/service.dart';
// import 'package:starter_project/core/api/bookings_api/bookings_api.dart';
// import 'package:starter_project/core/repositories/bookings_repository.dart';
// import 'package:starter_project/core/repositories/service_repository.dart';
// import 'package:starter_project/models/api_response_variants/bookings_response.dart';
// import 'package:starter_project/models/service/get_unpublished_service_reponse.dart';
// import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
// import 'package:starter_project/ui_helpers/size_config/size_config.dart';
// import 'package:starter_project/ui_helpers/widgets/error_retry_widget.dart';

// class CustomerUnCompletedOrders extends StatefulWidget {
//   @override
//   _CustomerUnCompletedOrdersState createState() => _CustomerUnCompletedOrdersState();
// }

// class _CustomerUnCompletedOrdersState extends State<CustomerUnCompletedOrders> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<BookingRepo>(context, listen: false).getCustomerUnCompletedOrders();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final model = Provider.of<BookingRepo>(context);
//     return ResponsiveState(
//       state: model.state,
//       busyWidget: Center(
//         child: Padding(
//           padding: EdgeInsets.all(SizeConfig.widthOf(10)),
//           child: CircularProgressIndicator(
//             strokeWidth: 6,
//             valueColor:
//                 AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
//           ),
//         ),
//       ),
//       errorWidget: Center(
//           child: Padding(
//         padding: EdgeInsets.all(SizeConfig.widthOf(10)),
//         child: ErrorRetryWidget(
//           errorMessage: model.error,
//           onTap: () => model.getCustomerUnCompletedOrders(),
//         ),
//       )),
//       idleWidget: Center(
//         child: Padding(
//           padding: EdgeInsets.all(SizeConfig.widthOf(10)),
//           child: CircularProgressIndicator(
//             strokeWidth: 6,
//             valueColor:
//                 AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
//           ),
//         ),
//       ),
//       noDataAvailableWidget: Center(
//         child: Padding(
//           padding: EdgeInsets.all(SizeConfig.widthOf(10)),
//           child: Text(
//             'No uncompleted bookings',
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//         ),
//       ),
//       dataFetchedWidget: SingleChildScrollView(
//         child: DataTable(
//             showBottomBorder: true,
//             dataRowHeight: 60,
//             headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
//             columns: <DataColumn>[
//               DataColumn(
//                 label: Text('Services'),
//               ),
//               DataColumn(
//                 label: Text('Booking Date'),
//               ),
//               DataColumn(
//                 label: Text('Actions'),
//               ),
//             ],
//             rows: [
//               ...model.customerUnCompletedOrders
//                   .map(
//                     (e) => DataRow(cells: [
//                       DataCell(Text(e.customer)),
//                       DataCell(Text(e.customer)),
//                       DataCell(
//                         PopupOptionMenu(e),
//                       )
//                     ]),
//                   )
//                   .toList(),
//             ]),
//       ),
//     );
//   }
// }

// enum MenuOption { Complete}

// class PopupOptionMenu extends StatelessWidget {
//   final Data data;
//   const PopupOptionMenu(this.data, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final models = Provider.of<BookingRepo>(context);
//     return PopupMenuButton<MenuOption>(
//       itemBuilder: (BuildContext context) {
//         return <PopupMenuEntry<MenuOption>>[
//           PopupMenuItem(
//             //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
//             child: ListTile(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Orders()));
//                   // print(data.service);
//                 },
//                 title: Text("Complete")),
//             value: MenuOption.Complete,
//           ),
//           // PopupMenuItem(
//           //   //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
//           //   child: ListTile(
//           //       onTap: () async{
//           //         bool success = await models.publishService(serviceId: data.id);
//           //         if(success){
//           //           //show snackbar
//           //                Get.snackbar(
//           //                                   'Success!',
//           //                                   'Booking Completed Successfully',
//           //                                   margin: EdgeInsets.symmetric(
//           //                                       vertical: 30, horizontal: 30),
//           //                                   snackStyle: SnackStyle.FLOATING,
//           //                                   snackPosition: SnackPosition.BOTTOM,
//           //                                   backgroundColor: Colors.black26,
//           //                                 );
//           //         }
                
//           //       },
//           //       title: Text("Complete")),
//           //   value: MenuOption.Complete,
//           // ),
//           // PopupMenuItem(
//           //   //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
//           //   child: ListTile(
//           //        onTap: () async{
//           //         bool success = await models.deleteUnpublishedService(serviceId: data.id);
//           //         if(success){
//           //           //show snackbar
//           //                Get.snackbar(
//           //                                   'Success!',
//           //                                   'Service Deleted Successfully',
//           //                                   margin: EdgeInsets.symmetric(
//           //                                       vertical: 30, horizontal: 30),
//           //                                   snackStyle: SnackStyle.FLOATING,
//           //                                   snackPosition: SnackPosition.BOTTOM,
//           //                                   backgroundColor: Colors.black26,
//           //                                 );
//           //         }
                
//           //       },
//           //       title: Text(
//           //         "Delete",
//           //         style: TextStyle(color: Colors.red),
//           //       )),
//           //   value: MenuOption.Delete,
//           // ),
//         ];
//       },
//     );
//   }
// }
