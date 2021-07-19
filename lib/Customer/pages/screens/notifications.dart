import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/utils/colors.dart';
import 'package:starter_project/core/repositories/notification_repository.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';

class CustomerNotifications extends StatefulWidget {
  @override
  _CustomerNotificationsState createState() => _CustomerNotificationsState();
}

class _CustomerNotificationsState extends State<CustomerNotifications> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NotificationRepository>(context, listen: false)
          .getCustomerNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotificationRepository>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.of(context).pop();
                  //   },
                  //   icon: Icon(
                  //     Icons.arrow_back_ios_rounded,
                  //   ),
                  // ),
                  Expanded(
                    child: Text(
                      "Notifications",
                      style: TextStyle(color: Color(0xff9477cb), fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Color(0xff9477cb),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ResponsiveState(
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
                  child: Text(model.error ?? "An error occurred."),
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
                      'No new notifications',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                dataFetchedWidget: ListView(
                  children: [
                    ...model.notifications
                        .map(
                          (e) => NotiCard(
                            title: e.approved ? "Approved Booking" : e.rejected ? "Rejected Booking" : "Pending booking" ,
                            description: e.approved ? '${e.salonName} has accepted your booking' : e.rejected ? '${e.salonName} has rejected your booking' : "Your booking is pending",
                            color: e.approved ? Colors.green[300].withOpacity(.5) : e.rejected ? Colors.red[300].withOpacity(.5) : Colors.amber.withOpacity(.5),
                            time: DateFormat.yMd().format(e.createdAt),
                            services: e.serviceName.join(", "),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotiCard extends StatelessWidget {
  final String time;
  final String title, description, services;
  final Color color;

  const NotiCard({Key key, this.time, this.title, this.color, this.description, this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border(
          bottom: BorderSide(
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.purple,
            radius: 5,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  description,
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  services,
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 5,),
                Text(time),
              ],
            ),
          )
        ],
      ),
    );
  }
}
