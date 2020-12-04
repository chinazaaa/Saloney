import 'package:flutter/material.dart';
import 'package:starter_project/Salon/pages/screens/utils/utils.dart';

//import 'package:starter_project/Salon/pages/config/palette.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
 final bool isHome;

  const CustomAppBar({Key key, @required this.isHome}) : super(key: key);

  @override
 Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    
    final _userImage = GestureDetector(
      // onTap: () => 
      child: Container(
        margin: EdgeInsets.only(right: 20.0, top: 20.0),
        height: 40.0,
        width: 37.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage(AvailableImages.assassin),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    return AppBar(
      elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: GestureDetector(
          // onTap: () => 
          child: Image.asset(
            AvailableImages.hamburger,
            width: 2.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: <Widget>[_userImage],
    );
  }
}