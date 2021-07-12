import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/screens/edit_service.dart';
import 'package:starter_project/Salon/pages/screens/service.dart';
import 'package:starter_project/Salon/pages/screens/unpublished_service.dart';
import 'package:starter_project/core/repositories/service_repository.dart';
import 'package:starter_project/models/service/get_published_service_reponse.dart';
import 'package:starter_project/models/service/salon_service.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';
import 'package:starter_project/ui_helpers/widgets/error_retry_widget.dart';

class PublishedServiceScreen extends StatefulWidget {
  @override
  _PublishedServiceScreenState createState() => _PublishedServiceScreenState();
}

class _PublishedServiceScreenState extends State<PublishedServiceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ServiceRepo>(context, listen: false).getPublishedServices();
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
          onTap: () => model.getPublishedServices(),
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
            'No Published services',
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
              ...model.publishedServices
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

enum MenuOption { Edit, UnPublish, Delete }

class PopupOptionMenu extends StatelessWidget {
  final SalonService data;
  const PopupOptionMenu(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final models = Provider.of<ServiceRepo>(context);
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
                      builder: (context) => EditService(
                        service: data,
                      ),
                    ),
                  );
                  // print(data.service);
                },
                title: Text("Edit")),
            value: MenuOption.Edit,
          ),
          PopupMenuItem(
            //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
            child: ListTile(
                onTap: () async {
                  bool success =
                      await models.unpublishService(serviceId: data.id);
                  if (success) {
                    //show snackbar
                    Get.snackbar(
                      'Success!',
                      'Service UnPublished Successfully',
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      snackStyle: SnackStyle.FLOATING,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black26,
                    );
                  }
                },
                title: Text("UnPublish")),
            value: MenuOption.UnPublish,
          ),
          PopupMenuItem(
            //child: Icon(Icons.edit, color: Colors.black, size: 28.0),
            child: ListTile(
                onTap: () async {
                  bool success =
                      await models.deletePublishedService(serviceId: data.id);
                  if (success) {
                    //show snackbar
                    Get.snackbar(
                      'Success!',
                      'Service Deleted Successfully',
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      snackStyle: SnackStyle.FLOATING,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black26,
                    );
                  }
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
