import 'package:flutter/material.dart';
import 'package:starter_project/animation/FadeAnimation.dart';
import 'package:starter_project/pages/login.dart';
import 'package:starter_project/pages/firebase_config/firebase_auth.dart';
//import 'package:starter_project/pages/firebase_config/firebase_cloud.dart';
import 'package:starter_project/pages/controllers.dart';
import 'package:progress_dialog/progress_dialog.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProgressDialog pr;
  final Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.2,
                          Text(
                            "Welcome to Saloney",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.2, makeInput(hint: "Username", inputController: TextController.userNameController)),
                      FadeAnimation(1.3, makeInput(hint: "Phone Number", inputController: TextController.phoneNumberController)),
                      FadeAnimation(1.4, makeInput(hint: "Email", inputController: TextController.emailController)),
                      FadeAnimation(
                          1.5, makeInput(hint: "Password",inputController: TextController.passwordController, obscureText: true)),
                      FadeAnimation(
                          1.6,
                          makeInput(
                              hint: "Confirm Password",inputController: TextController.confirmPasswordController, obscureText: true)),
                    ],
                  ),
                ),
               InkWell(
                 onTap: () => validateAndSubmit(),
                                child: FadeAnimation(
                          1.5,
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
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                  ),
               ),
                
                FadeAnimation(
                    1.6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account?"),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>LoginPage()));
                          },
                          child: Text(" Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({obscureText = false, String hint, TextEditingController inputController,TextInputType inputType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          obscureText: obscureText,
          controller: inputController,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          validator: (value) {
      if (value.isEmpty) {
        return "Field Can't be empty";
      } else {
        return null;
      }
    },
    keyboardType: inputType,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
    void validateAndSubmit() {
    if (validateAndSave()) {
      pr.show();
      auth.signUpUser(
          scaffoldKey: _scaffoldKey,
          email: TextController.emailController.text,
          password: TextController.passwordController.text,
          info: {
            'userName': TextController.userNameController.text,
            'phoneNumber': TextController.phoneNumberController.text
          }).whenComplete(() {
        pr.hide();
      });
    }
  }
}
