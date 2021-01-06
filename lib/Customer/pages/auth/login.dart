import 'package:flutter/material.dart';
//import 'package:starter_project/Customer/pages/password/forgot_password.dart';
import 'package:starter_project/Customer/pages/screens/home.dart';
import 'package:starter_project/animation/FadeAnimation.dart';
import 'package:starter_project/home_screen.dart';


// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  
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
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
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
                alignment: Alignment.topLeft,  
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              "Login to your account",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.2, makeInput(hint: "Email Address")),
                          
                          FadeAnimation(1.3,
                              makeInput(hint: "Password", obscureText: true)),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                             FadeAnimation(
                                1.4,
                              Container(
                                
                                height: 7,
                                child: Checkbox(

                                  value: false,
                                  onChanged: (value) {},
                                )),
                              ),
                               FadeAnimation(
                                1.5,
                              Text("Remember me")),
                              Spacer(),
                               FadeAnimation(
                                1.6,
                                InkWell(
                                    onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
                                    },
                                
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: Color(0xff9477cb)),
                                )),
                              )
                              ],
                          ))
                        ],
                      ),
                    ),
                         InkWell(
                          
                                                    child: FadeAnimation(1.5, Padding(
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
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
                      ),
                    )),
                         ),
                     FadeAnimation(1.5, Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                         InkWell(
                                    onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
                                    },
                        child:Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                         )),
                      ],
                    ))
                  ],
                ),
              ),
            
            ],
          ),
        ),
      ));
    
  }
Widget makeInput({obscureText = false, String hint, TextEditingController inputController}) {
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