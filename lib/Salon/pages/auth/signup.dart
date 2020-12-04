import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:starter_project/models/http_response.dart';
import 'package:starter_project/Salon/pages/auth/login.dart';
import 'package:flutter/services.dart';
import 'package:starter_project/services/http_service_salon.dart';

// ignore: must_be_immutable
class SalonSignUp extends StatefulWidget {
  @override
  _SalonSignUpState createState() => _SalonSignUpState();
}

class _SalonSignUpState extends State<SalonSignUp> {
  int _index = 0;
  bool _loading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
            key: _scaffoldKey,
              body: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              _backButton(context: context),
              TabBar(
                onTap: (int index){
                  setState(() {
                    _index = index;
                  });
                },
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
                child:  IndexedStack(
                  index: _index,
                  children: [
                    _login(context: context),
                    _yourDetails(context: context),
                  ],
                )
                // TabBarView(
                //   children: [
                //     _login(context: context),
                //     _yourDetails(context: context),
                //   ],
                // ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<HttpResponse> _signUp() async {
    setState((){
      _loading = !_loading;
    });
    try{
      HttpResponse httpresponse = await HttpService.salonSignup();
        setState((){
        _loading = !_loading;
      });
      Fluttertoast.showToast(
        msg: httpresponse.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
      // _scaffoldKey.currentState.showSnackBar(SnackBar(
        
      //   content: Padding( 
      //     padding: const EdgeInsets.all(8.0),
      //     child:  Text(httpresponse.message)),
      //   behavior:  SnackBarBehavior.floating 
      //   ) );
    }catch(e){
           setState((){
          _loading = !_loading;
        });
    }
  }

  Widget makeInput(
      {obscureText = false,
      String hint,
      TextEditingController inputController,
      TextInputType inputType}) {
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
            InkWell(
              onTap:(){
                 setState((){
                    _index = 1;
                  });
              },
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
                    "Next",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?"),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      " Login",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
                  makeInput(hint: "Location"),
                ],
              ),
            ),
            InkWell(
              onTap:_signUp
              ,
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
                  child: _loading ? CircularProgressIndicator(
                    // valueColor: AlwaysStoppedAnimation(color: Colors.white)
                  ) : Text(
                    "Sign up",
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
