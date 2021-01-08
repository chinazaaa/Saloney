import 'package:flutter/material.dart';
import 'package:starter_project/animation/FadeAnimation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:starter_project/models/http_response.dart';
import 'package:starter_project/Customer/pages/auth/login.dart';
import 'package:starter_project/services/http_service_customer.dart';
// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
   bool _loading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,
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
                      FadeAnimation(1.2, makeInput(hint: "Username")),
                      FadeAnimation(1.3, makeInput(hint: "Phone Number")),
                      FadeAnimation(1.4, makeInput(hint: "Email")),
                      FadeAnimation(
                          1.5, makeInput(hint: "Password", obscureText: true)),
                      FadeAnimation(
                          1.6,
                          makeInput(
                              hint: "Confirm Password", obscureText: true)),
                    ],
                  ),
                ),
               InkWell(
                 onTap:_signUp
              ,
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

  Future<HttpResponse> _signUp() async {
      _loading = !_loading;
  
    try{
      HttpResponse httpresponse = await HttpService.customerSignup();
        _loading = !_loading;

      Fluttertoast.showToast(
        msg: httpresponse.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    
          _loading = !_loading;
    
    }
    catch(e){
          _loading = !_loading;
      
    }
  }
  Widget makeInput({obscureText = false, String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          obscureText: obscureText,
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
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
   
}
