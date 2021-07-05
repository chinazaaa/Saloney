import 'package:flutter/material.dart';

class CustomerCompletedOrders extends StatelessWidget {
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
                label: Text('Salon'),
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
            ],
            rows: [
              DataRow(cells: [
                 DataCell(Text('Sudu')),
                  DataCell(Text('08024771835')),
                DataCell(Text('Hair')),
                 DataCell(Text('Tuesday 20th November, 2021')),
               
              ]),
              DataRow(cells: [
                 DataCell(Text('Sudu')),
                  DataCell(Text('08024771835')),
                DataCell(Text('Cruise')),
                DataCell(Text('Cruise')),
               
              ]),
              DataRow(cells: [
                 DataCell(Text('Sudu')),
                  DataCell(Text('08024771835')),
                DataCell(Text('Cruise')),
                DataCell(Text('Cruise')),
               
              ])
            ]),
      ),
          );
  }
}
