import 'package:flutter/material.dart';
import 'package:starter_project/animation/FadeAnimation.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      
      body: SafeArea(
              child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                            Container(
                alignment: Alignment.topLeft,
                child: IconButton(
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
 
                Column(
                  children: <Widget>[
                    FadeAnimation(1, Text("Sign up", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),)),
                    SizedBox(height: 20,),
                    FadeAnimation(1.2, Text("Just a little information and your account is ready", style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700]
                    ),)),
                  ],
                ),
                Column(
                  children: <Widget>[
                     FadeAnimation(1.2, makeInput(label: "Username")),
                
                    FadeAnimation(1.4, makeInput(label: "Email")),
                    FadeAnimation(1.5, makeInput(label: "Password", obscureText: true)),
                    FadeAnimation(1.6, makeInput(label: "Confirm Password", obscureText: true)),
                  ],
                ),
                FadeAnimation(1.5, Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 60,
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            color: Color(0xfff3236e),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black)),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                  ),
                )),
                FadeAnimation(1.6, Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    Text(" Login", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18
                    ),),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}