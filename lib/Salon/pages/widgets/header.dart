import 'package:flutter/material.dart';
import 'package:starter_project/Salon/pages/screens/utils/colors.dart';
import 'package:starter_project/Salon/pages/screens/utils/utils.dart';

class Header extends StatelessWidget {
  final bool isHome;

  const Header({Key key, @required this.isHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Notifications",
            style: AppTextStyles.headerTextStyle,
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: CustomColors.primaryColor.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                "12",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
