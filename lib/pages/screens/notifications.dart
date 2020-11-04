import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(),
                      Text("A reservation has been placed by DREW BRIGHT"),
                      Container(),
                    ],
                  ),
                  Row(children: [
                    FlatButton(onPressed:() {} , child: Text("Cancel")),
                     FlatButton(onPressed:() {} , child: Text("Accept"))
                  ],)
                ],
              ),
            );
          },
          separatorBuilder: null,
          itemCount: null),
    );
  }
}
