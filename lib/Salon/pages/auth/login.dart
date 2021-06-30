import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:starter_project/Customer/pages/password/change_password.dart';
import 'package:starter_project/Salon/pages/password/forgot_password.dart';
import 'package:starter_project/ui_helpers/animation/FadeAnimation.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';
import 'package:starter_project/home_screen.dart';
import 'package:starter_project/Salon/pages/screens/bottom_nav_screen.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
//import 'package:starter_project/ui_helpers/widgets/loading_button.dart';

// ignore: must_be_immutable
class SalonLoginPage extends StatelessWidget {
  //Controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> mykey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AuthRepository>(context);
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
                      Form(
                        key: mykey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: <Widget>[
                              FadeAnimation(
                                  1.2,
                                  makeInput(
                                      hint: "Email",
                                      controller: email,
                                      validator: (value) =>
                                          model.validateEmail(value))),
                              FadeAnimation(
                                  1.5,
                                  makeInput(
                                      hint: "Password",
                                      obscureText: true,
                                      controller: password,
                                      validator: (value) =>
                                          model.validatePassword(value))),
                              ResponsiveState(
                                state: model.state,
                                busyWidget: CircularProgressIndicator(),
                                idleWidget: InkWell(
                                  onTap: () => loginSalon(context),
                                  child: FadeAnimation(
                                    1.5,
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 40),
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        height: 60,
                                        padding:
                                            EdgeInsets.only(top: 3, left: 3),
                                        decoration: BoxDecoration(
                                          color: Color(0xff9477cb),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  FadeAnimation(
                                    1.4,
                                    Container(
                                        height: 7,
                                        child: Checkbox(
                                          value: model.checkboxValue,
                                          onChanged: (value) {
                                            model.toggleCheckbox();
                                          },
                                        )),
                                  ),
                                  FadeAnimation(1.5, Text("Remember me")),
                                  Spacer(),
                                  FadeAnimation(
                                    1.6,
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgotPage()));
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
                      ),
                      // InkWell(
                      //   child: FadeAnimation(
                      //       1.5,
                      //       Padding(
                      //         padding: EdgeInsets.symmetric(horizontal: 40),
                      //         child: Container(
                      //           width: double.infinity,
                      //           alignment: Alignment.center,
                      //           height: 60,
                      //           padding: EdgeInsets.only(top: 3, left: 3),
                      //           decoration: BoxDecoration(
                      //             color: Color(0xff9477cb),
                      //             borderRadius: BorderRadius.circular(5),
                      //           ),
                      //           child: Text(
                      //             "Login",
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 18,
                      //                 color: Colors.white),
                      //           ),
                      //         ),
                      //       )),
                      // ),
                      FadeAnimation(
                          1.5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Don't have an account?"),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
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

  loginSalon(context) async {
    final model = Provider.of<AuthRepository>(context, listen: false);
    if (!mykey.currentState.validate()) return;

    bool success = await model.login(
        isCustomer: false, email: email.text, password: password.text);

    if (success) {
      //go to otp page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
    } else {
      //Do nothing
    }
  }

  Widget makeInput(
      {obscureText = false,
      String hint,
      TextEditingController controller,
      Function validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
