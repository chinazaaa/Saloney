import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/ui_helpers/animation/FadeAnimation.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';
import 'package:starter_project/Customer/pages/auth/login.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';

import 'otp.dart';

// ignore: must_be_immutable
class CustomerSignupPage extends StatelessWidget {
  bool _loading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Controllers
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  GlobalKey<FormState> mykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AuthRepository>(context);
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
                Form(
                  key: mykey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.2,
                            makeInput(
                                hint: "Username",
                                controller: name,
                                validator: (value) =>
                                    model.validateName(value))),
                        FadeAnimation(
                            1.3,
                            makeInput(
                                hint: "Phone Number",
                                controller: phone,
                                validator: (value) =>
                                    model.validatePhoneNumber(value))),
                        FadeAnimation(
                            1.4,
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
                        FadeAnimation(
                            1.6,
                            makeInput(
                                hint: "Confirm Password",
                                obscureText: true,
                                controller: confirmpassword,
                                validator: (value) => value == password.text
                                    ? null
                                    : "Passwords do not match")),
                      ],
                    ),
                  ),
                ),
                ResponsiveState(
                  state: model.state,
                  busyWidget: CircularProgressIndicator(),
                  idleWidget: InkWell(
                    onTap: ()=> signUpCustomer(context),
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
                                    builder: (context) => CustomerLoginPage()));
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

  signUpCustomer(BuildContext context) async {
    final model = Provider.of<AuthRepository>(context, listen: false);
    if (!mykey.currentState.validate()) return;

    bool success = await model.register(
        isCustomer: true,
        userName: name.text,
        phone: phone.text,
        email: email.text,
        password: password.text);

    if (success) {
      //go to otp page
      Navigator.push(context, MaterialPageRoute(builder: (context) =>CustomerOtpScreen()));
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
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          validator: validator,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
