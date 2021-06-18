import 'package:flutter/material.dart';

class PublishedService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
          showBottomBorder: true,
          dataRowHeight: 60,
          headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
          columns: <DataColumn>[
            DataColumn(
              label: Text('Service'),
            ),
            DataColumn(
              label: Text('Image'),
            ),
            DataColumn(
              label: Text('Actions'),
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Hair')),
              DataCell(Image.network(
                'https://res.cloudinary.com/saloney/image/upload/v1623862747/SaloneyLogo.png',
              )),
              DataCell(
                PopupOptionMenu(),
              )
            ]),
            DataRow(cells: [
              DataCell(Text('Cruise')),
              DataCell(Text('Cruise')),
              DataCell(Text('Cruise'))
            ]),
            DataRow(cells: [
              DataCell(Text('Cruise')),
              DataCell(Text('Cruise')),
              DataCell(Text('Cruise'))
            ])
          ]),
    );
  }
}
enum MenuOption {Edit,Unpublish, Delete}
class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
            child: Text("Edit"),
          value: MenuOption.Edit,
          ),
            PopupMenuItem(
                //child: Icon(Icons.cancel, color: Colors.black, size: 28.0),
              child: Text("Publish"),
          value: MenuOption.Unpublish,
          ),
            PopupMenuItem(
                //child: Icon(Icons.delete,color: Colors.black, size: 28.0),
              child: Text("Delete"),
          value: MenuOption.Delete,
          )
        ];
      },
    );
  }
}
