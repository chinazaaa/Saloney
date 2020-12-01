import 'package:flutter/material.dart';
import 'package:starter_project/pages/login.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class SalonSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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

  Widget dropdownField({String hint}) {
   
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: DropdownButtonFormField(
        hint: Text('$hint', style: TextStyle(color: Colors.grey[600])),
        icon: Icon(Icons.keyboard_arrow_down),
        onChanged: (value) {print(value);},
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
                  makeInput(hint: "Username"),
                  makeInput(hint: "Phone Number"),
                  makeInput(hint: "Email"),
                  makeInput(hint: "Password"),
                  makeInput(hint: "Confirm Password"),
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
                  makeInput(hint: "Name of Salon"),
                  dropdownField(hint: "Type of Salon"),
                  makeInput(hint: "Location"),
                ],
              ),
            ),
            InkWell(
                
                          child: Padding(
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
            ),
          ],
        ),
      ),
    );
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