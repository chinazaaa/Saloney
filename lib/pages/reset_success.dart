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
            "Reset Complete",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: Image.asset(
                       "assets/reset_success.png"),
                    height: 150,
                  ),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      height: 60,
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        color: Color(0xfff3236e),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Continue",
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