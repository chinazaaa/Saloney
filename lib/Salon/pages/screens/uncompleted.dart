import 'package:flutter/material.dart';

class SalonUncompletedOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FittedBox(
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
              DataRow(cells: [
                 DataCell(Text('Naza')),
                  DataCell(Text('08024771835')),
                DataCell(Text('Hair')),
                 DataCell(Text('Tuesday 20th November, 2021')),
                DataCell(
                  PopupOptionMenu(),
                )
              ]),
              DataRow(cells: [
                 DataCell(Text('Naza')),
                DataCell(Text('08024771835')),
                DataCell(Text('Cruise')),
                DataCell(Text('Cruise')),
                DataCell(Text('Cruise'))
              ]),
              DataRow(cells: [
                 DataCell(Text('Naza')),
                DataCell(Text('08024771835')),
                DataCell(Text('Cruise')),
                DataCell(Text('Cruise')),
                DataCell(Text('Cruise'))
              ])
            ]),
      ),
          );
  }
}
enum MenuOption {Complete}
class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            // child: Icon(Icons.done, color: Colors.black, size: 28.0),
            child: Text("Complete"),
          value: MenuOption.Complete,
          ),
          //   PopupMenuItem(
          //       child: Icon(Icons.cancel, color: Colors.black, size: 28.0),
          //     //child: Text("Publish"),
          // value: MenuOption.Unpublish,
          // ),
          //   PopupMenuItem(
          //       child: Icon(Icons.delete,color: Colors.black, size: 28.0),
          //     //child: Text("Delete"),
          // value: MenuOption.Delete,
          //    )
        ];
      },
    );
  }
}