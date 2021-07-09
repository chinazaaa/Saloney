import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/core/repositories/bookings_repository.dart';
import 'package:starter_project/models/api_response_variants/getbookings_response.dart';
import 'package:starter_project/models/booking.dart';
//import 'package:starter_project/models/api_response_variants/bookings_response.dart';
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
      Provider.of<BookingRepo>(context, listen: false)
          .getSalonUnCompletedBookings();
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              showBottomBorder: true,
              dataRowHeight: 60,
              headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Customer'),
                ),
                DataColumn(
                  label: Text('Price'),
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
                      (e) {
                        int totalPrice = 0;
                        List<int> prices = e.servicePrice.map((e) => double.tryParse(e).round()).toList();
                        for(int i=0; i<prices.length; i++)
                          totalPrice = totalPrice + (prices[i] ??0);
                        return DataRow(cells: [
                        DataCell(Text(e.customerName ?? 'Unknown')),
                        DataCell(Text(prices.join("+") + " = " + totalPrice.toString())),
                        DataCell(Text(e.customerPhone.toString())),
                        DataCell(Text(e.serviceName.join(", "))),
                        DataCell(Text(e.bookingDate)),
                        DataCell(
                          PopupOptionMenu(e),
                        )
                      ]);
                      },
                    )
                    .toList(),
              ]),
        ),
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
            child: ListTile(title: Text("Complete")),
            value: MenuOption.Complete,
          ),
        ];
      },
    );
  }
}
