import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/screens/notifications.dart';
import 'package:starter_project/Customer/pages/utils/service.dart';
import 'package:starter_project/Customer/pages/screens/widgets/badge.dart';
import 'package:starter_project/Customer/pages/screens/widgets/grid_service.dart';
import 'package:starter_project/core/repositories/customer_repository.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';
import 'package:starter_project/ui_helpers/widgets/error_retry_widget.dart';

class SalonServicesScreen extends StatefulWidget {
  final String salonId, salonName, description;
  const SalonServicesScreen(this.salonId, this.salonName, this.description);
  @override
  _SalonServicesScreenState createState() => _SalonServicesScreenState();
}

class _SalonServicesScreenState extends State<SalonServicesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //Load services using salon id
      Provider.of<CustomerRepository>(context, listen: false)
          .getSalonServices(widget.salonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CustomerRepository>(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xff9477cb),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Salon Services",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              //color: Color(0xff9477cb),
              size: 22.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return CustomerNotifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ResponsiveState(
        state: model.state,
        busyWidget: Center(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.widthOf(10)),
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor),
            ),
          ),
        ),
        errorWidget: Center(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.widthOf(10)),
              child: ErrorRetryWidget(
                errorMessage: model.error,
                onTap: () => model.getSalonServices(widget.salonId),
              ),
            )),
        idleWidget: Center(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.widthOf(10)),
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor),
            ),
          ),
        ),
        noDataAvailableWidget: Center(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.widthOf(10)),
              child: Text(
                'Salon has not added any service',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )),
        dataFetchedWidget: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: GridView(
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.25),
            ),
            children: [
              ...model.salonServices.map((e) => ServiceSalonWidget(
                imgUri: e.image,
                serviceName: e.service,
                servicePrice: e.price,
                serviceInfo: e,
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
