import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/screens/edit_service.dart';
import 'package:starter_project/Salon/pages/screens/published_service.dart';
import 'package:starter_project/core/repositories/service_repository.dart';
import 'package:starter_project/models/service/get_unpublished_service_reponse.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';
import 'package:starter_project/ui_helpers/widgets/error_retry_widget.dart';

class UnPublishedService extends StatefulWidget {
  @override
  _UnPublishedServiceState createState() => _UnPublishedServiceState();
}

class _UnPublishedServiceState extends State<UnPublishedService> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ServiceRepo>(context, listen: false).getUnpublishedServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ServiceRepo>(context);
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
          onTap: () => model.getUnpublishedServices(),
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
            'No Unpublished services',
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
              ...model.unpublishedServices
                  .map(
                    (e) => DataRow(cells: [
                      DataCell(Text(e.service)),
                      DataCell(e.image == null
                          ? Text('No Image')
                          : Image.network(e.image)),
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

enum MenuOption { Edit, Publish, Delete }

class PopupOptionMenu extends StatelessWidget {
  final UnpublishedService data;
  const PopupOptionMenu(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
            child: ListTile(
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                   EditService()));
                 // print(data.service);
                },
                title: Text("Edit")),
            value: MenuOption.Edit,
          ),
          PopupMenuItem(
            //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
            child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                   PublishedService()));
                },
                title: Text("Publish")),
            value: MenuOption.Publish,
          ),
          PopupMenuItem(
            //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
            child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                   UnPublishedService()));
                },
                title: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                )),
            value: MenuOption.Delete,
          ),
        ];
      },
    );
  }
}
