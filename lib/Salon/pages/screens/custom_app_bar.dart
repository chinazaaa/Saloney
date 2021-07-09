import 'package:flutter/material.dart';
import 'package:starter_project/Salon//pages/config/palette.dart';
import 'package:starter_project/Salon/pages/screens/notifications.dart';
import 'package:starter_project/Salon/pages/screens/orders.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.category),
        iconSize: 28.0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SalonOrders()));
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none),
          iconSize: 28.0,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationsPage()));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
