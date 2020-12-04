import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Chats", 
        style: TextStyle(fontWeight: FontWeight.w600,
              color: Color(0xff9477cb))),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: buildMessageTile,
      ),
    );
  }

  Widget buildMessageTile(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/salon.png"),
          ),
          trailing: Text('3 hours ago',
              style: TextStyle(fontWeight: FontWeight.w600,
              color: Color(0xff9477cb)),
              ),
          title: Text(
            "Cruise Goddess",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text('Yes we are available'),
        ),
      ),
    );
  }
}
