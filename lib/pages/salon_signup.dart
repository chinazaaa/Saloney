import 'package:flutter/material.dart';
import 'package:starter_project/pages/login.dart';
import 'package:flutter/services.dart';
import 'package:starter_project/pages/firebase_config/firebase_auth.dart';
import 'package:starter_project/pages/firebase_config/firebase_cloud.dart';
import 'package:starter_project/pages/controllers.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SalonSignUp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProgressDialog pr;
  final Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
     pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    //  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //    statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.dark,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    //   systemNavigationBarColor: Colors.transparent,
    
    // ));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
          child: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
              body: Column(
            children: <Widget>[
              SizedBox(
                      height: 20.0,
                    ),
              _backButton(context: context),
              TabBar(
                labelPadding: EdgeInsets.symmetric(vertical: 10),
                indicatorColor: Colors.transparent,
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                unselectedLabelColor: Colors.grey[600],
                labelColor: Color(0xff9477cb),
                tabs: [
                  Text(
                    'Your details',
                  ),
                  Text('Salon details'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _login(context: context),
                    _yourDetails(context: context),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget makeInput({obscureText = false, String hint, TextEditingController inputController,TextInputType inputType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
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
    //           validator: (value) {
    //   if (value.isEmpty) {
    //     return "Field Can't be empty";
    //   } else {
    //     return null;
    //   }
    // },
     keyboardType: inputType,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
    
  }

  Widget dropdownField({String hint}) {
   
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: DropdownButtonFormField(
        hint: Text('$hint', style: TextStyle(color: Colors.grey[600])),
        icon: Icon(Icons.keyboard_arrow_down),
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
        ),
        items: [
          DropdownMenuItem(
            child: Text('Beauty salon'),
            value: 'Beauty salon',
          ),
          DropdownMenuItem(
            child: Text('Barbing salon'),
            value: 'Barbing salon',
          )
         
        ],
      ),
    );
  }

  //Login Screen
  _login({BuildContext context}) {
    return SingleChildScrollView(
      child: Container(
        // color: Colors.blue,
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome to Saloney",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  makeInput(hint: "Username", inputController: TextController.userNameController),
                  makeInput(hint: "Phone Number", inputController: TextController.phoneNumberController),
                  makeInput(hint: "Email", inputController: TextController.emailController),
                  makeInput(hint: "Password", inputController: TextController.passwordController, obscureText: true),
                  makeInput(hint: "Confirm Password", inputController: TextController.confirmPasswordController, obscureText: true),
                ],
              ),
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
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
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
                child:Text(
                  " Login",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Signup screen
  _yourDetails({BuildContext context}) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                   //onTap: () => validateAndSubmit(),
                  Text(
                    "Sign up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome to Saloney",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  makeInput(hint: "Name of Salon", inputController: TextController.nameController),
                  dropdownField(hint: "Type of Salon"),
                  makeInput(hint: "Location", inputController: TextController.locationController),
                ],
              ),
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
                  "Done",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
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
            'phoneNumber': TextController.phoneNumberController.text,
            'nameOfSalon': TextController.nameController.text,
            'location': TextController.locationController.text
          }).whenComplete(() {
        pr.hide();
      });
    }
  }
}

_backButton({BuildContext context}) {
  return Container(
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
  ); 
}