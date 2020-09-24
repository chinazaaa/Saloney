import 'package:flutter/material.dart';


class ButtomPage extends StatefulWidget {
  @override
  _ButtomPageState createState() => _ButtomPageState();
}

class _ButtomPageState extends State<ButtomPage> {
    int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.dashboard, 0),
          buildNavBarItem(Icons.chat, 1),
          buildNavBarItem(Icons.add_box, 2),
          buildNavBarItem(Icons.notifications, 3),
          buildNavBarItem(Icons.person, 4),
        ],
      ),
    //  appBar: AppBar(
    //      title: Text("Custom Bottom Navigation Bar"),
    //   ),
    //   body: Center(
    //     child: Text("Hello from Item $_selectedItemIndex"),
    //   ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Color(0xfff3236e)),
                ),
                gradient: LinearGradient(colors: [
                  Color(0xfff3236e).withOpacity(0.3),
                  Color(0xfff3236e).withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? Colors.black : Color(0xfff3236e) ,
        ),
      ),
    );
  }
}
