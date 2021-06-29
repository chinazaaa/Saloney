import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/utils/colors.dart';

class CustomerNotifications  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          SafeArea(
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
                        style: TextStyle(color: Color(0xff9477cb)),
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
              SizedBox(
                height: 20,
              ),
              NotiCard(
                title: "Your booking has been approved",
                time: "Now",
              ),
              NotiCard(
                title: "Your booking has been declined",
                time: "1 h ago",
                color: AppColor.placeholderBg,
              ),
              NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "3 h ago",
              ),
              NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "5 h ago",
              ),
              NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "05 Sep 2021",
                color: AppColor.placeholderBg,
              ),
              NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "12 Aug 2020",
                color: AppColor.placeholderBg,
              ),
              NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "20 Jul 2021",
              ),
              NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "12 Jul 2021",
              ),
            ],
          )),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     child: CustomNavBar(
          //       menu: true,
          //     ))
        ],
      ),
    );
  }
}

class NotiCard extends StatelessWidget {
  const NotiCard({
    Key key,
    String time,
    String title,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _color = color,
        super(key: key);

  final String _time;
  final String _title;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
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
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _title,
                style: TextStyle(
                  color: AppColor.primary,
                ),
              ),
              Text(_time),
            ],
          )
        ],
      ),
    );
  }
}
