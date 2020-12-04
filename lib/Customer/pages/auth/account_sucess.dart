import 'package:flutter/material.dart';
class AccountSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          toolbarHeight: 100,
          title: Text(
            "Account created \n successfully",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
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
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: Image.asset(
                      "assets/account_success.png"),
                    height: 150,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "We just sent you a verification email",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      height: 60,
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        color: Color(0xff9477cb),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
  
}