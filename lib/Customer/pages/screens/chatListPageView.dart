import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/screens/ChatListViewItem.dart';
import 'package:starter_project/Customer/pages/screens/Loading.dart';

class CustomerChatListPageView extends StatefulWidget {
  @override
  _CustomerChatListPageViewState createState() => _CustomerChatListPageViewState();
}

class _CustomerChatListPageViewState extends State<CustomerChatListPageView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return CustomerLoading();
    } else {
      return Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
            // iconTheme: IconThemeData(
            //   color: Colors.red,
            // ),
            centerTitle: true,
            title: Text(
              'Chats',
              style: TextStyle(color: Color(0xff9477cb), fontSize: 18),
            ),
          
          ),
          body: Container(
            child: Container(
              decoration: BoxDecoration(
               color: Color(0xff9477cb),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: ListView(
                children: <Widget>[
                  CustomerChatListViewItem(
                    hasUnreadMessage: true,
                    image: AssetImage('assets/1.png'),
                    lastMessage:
                        "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                    name: "Bree Jarvis",
                    newMesssageCount: 8,
                    time: "19:27 PM",
                  ),
                  CustomerChatListViewItem(
                    hasUnreadMessage: true,
                    image: AssetImage('assets/2.png'),
                    lastMessage:
                        "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                    name: "Alex",
                    newMesssageCount: 5,
                    time: "19:27 PM",
                  ),
                  CustomerChatListViewItem(
                    hasUnreadMessage: false,
                    image: AssetImage('assets/3.png'),
                    lastMessage:
                        "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                    name: "Carson Sinclair",
                    newMesssageCount: 0,
                    time: "19:27 PM",
                  ),
                  CustomerChatListViewItem(
                    hasUnreadMessage: false,
                    image: AssetImage('assets/account_success.png'),
                    lastMessage:
                        "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                    name: "Lucian Guerra",
                    newMesssageCount: 0,
                    time: "19:27 PM",
                  ),
                  CustomerChatListViewItem(
                    hasUnreadMessage: false,
                    image: AssetImage('assets/customer.png'),
                    lastMessage:
                        "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                    name: "Sophia-Rose Bush",
                    newMesssageCount: 0,
                    time: "19:27 PM",
                  ),
                  CustomerChatListViewItem(
                    hasUnreadMessage: false,
                    image: AssetImage('assets/salon.png'),
                    lastMessage:
                        "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                    name: "Mohammad",
                    newMesssageCount: 0,
                    time: "19:27 PM",
                  ),
                  CustomerChatListViewItem(
                    hasUnreadMessage: false,
                    image: AssetImage('assets/customer.png'),
                    lastMessage:
                        "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                    name: "Jimi Cooke",
                    newMesssageCount: 0,
                    time: "19:27 PM",
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
