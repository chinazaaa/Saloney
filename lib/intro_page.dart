import 'package:starter_project/locator.dart';
import 'package:starter_project/models/step_models.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/home_screen.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';

import 'Customer/pages/auth/otp.dart';
import 'Customer/pages/screens/home.dart';
import 'Salon/pages/auth/otp.dart';
import 'Salon/pages/screens/bottom_nav_screen.dart';
import 'infrastructure/user_info_cache.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  List<StepModel> list = StepModel.list;
  var _controller = PageController();
  var initialPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });

  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Initialize % sizing helper
    SizeConfig().init(context);
  }

  initialize() async {
    //Initiating the UserInfoCache Data to be used in app
    var user = locator<UserInfoCache>();
    await user.getUserDataFromStorage();

    //if user is logged in
    if(user.isLoggedIn){
      if(user.cache.isCustomer){
        //perform customer checks
        if(user.cache.customer.data == null){
          //Go to customer OTP page
          Navigator.push(context, MaterialPageRoute(builder: (context) =>CustomerOtpScreen()));
        } else {
          //Got to home
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }
      } else {
        //perform salon checks
        if(user.cache.salon.data == null){
          //Go to customer OTP page
          Navigator.push(context, MaterialPageRoute(builder: (context) =>SalonOtpScreen()));
        } else {
          //Got to home screen
          Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
        }
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    // Initialize Size Config
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page.round();
      });
    });

    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(),
          _body(_controller),
          _indicator(),
        ],
      ),
    );
  }

  _appBar() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          initialPage == 0
              ? Container()
              : GestureDetector(
                  onTap: () {
                    if (initialPage > 0)
                      _controller.animateToPage(initialPage - 1,
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeIn);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    // decoration: BoxDecoration(
                    //   color: Colors.grey.withAlpha(50),
                    //   borderRadius: BorderRadius.all(
                    //     Radius.circular(15),
                    //   ),
                    // ),
                    // child: Icon(Icons.arrow_back_ios),
                  ),
                ),
          initialPage == 2
              ? Container()
              : FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  _body(PageController controller) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              index == 1
                  ? _displayText(list[index].text)
                  : _displayImage(list[index].id),
              SizedBox(
                height: 25,
              ),
              Text(
                list[index].header,
                style: TextStyle(
                    fontFamily: 'SFProText',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black),
              ),
              index == 1
                  ? _displayImage(list[index].id)
                  : _displayText(list[index].text),
            ],
          );
        },
      ),
    );
  }

  _indicator() {
    return Container(
      width: 90,
      height: 90,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xff9477cb)),
                value: (initialPage + 1) / (list.length + 1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
//Some new stuffs
                if (_controller.page.round() >= 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
//Stuff ends here
                if (initialPage < list.length)
                  _controller.animateToPage(initialPage + 1,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn);

//I removed stuffs from here
//Why? Just cos I feel like 😄
              },
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Color(0xff9477cb),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _displayText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.normal,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }

  _displayImage(int path) {
    return Image.asset(
      "assets/$path.png",
      height: MediaQuery.of(context).size.height * .5,
    );
  }
}
