import 'package:flutter/material.dart';
// import 'package:starter_project/pages/login.dart';
import 'package:starter_project/Salon/pages/auth/signup.dart';
import 'package:starter_project/Customer/pages/auth/signup.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
         backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
          // leading: Icon(Icons.arrow_back, color: Colors.grey[400]),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 28),
                    ),
                    SizedBox(height: 5.0),
                    Text('How would you like to use our \nplatform!',
                        style:
                            TextStyle(fontSize: 18, color: Colors.grey[600])),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerSignupPage()));
                  setState(() {
                    colorText1 = Color(0xff9477cb);
                    colorText2 = Colors.black;
                  });
                },
                child: _customCard(
                    text: 'A Customer',
                    borderColor: colorText1,
                    textColor: colorText1,
                    imageLink:
                        "assets/customer.png"),
              ),
              SizedBox(
                height: 80.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SalonSignUp()));
                  setState(() {
                    colorText2 = Color(0xff9477cb);
                    colorText1 = Colors.black;
                  });
                },
                child: _customCard(
                    text: 'A Salon Owner',
                    borderColor: colorText2,
                    textColor: colorText2,
                    imageLink:
                        "assets/salon.png"),
              ),
              Spacer(),
            ],
          ),
        ),
      );
  }

  Color colorText1 = Colors.black;
  Color colorText2 = Colors.black;

  Widget _customCard(
      {String text, Color borderColor, Color textColor, String imageLink}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageLink),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 17, color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}