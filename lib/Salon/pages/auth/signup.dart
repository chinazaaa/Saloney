import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/auth/otp.dart';
import 'package:starter_project/ui_helpers/animation/FadeAnimation.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';
import 'package:starter_project/Salon/pages/auth/login.dart';
import 'package:flutter/services.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

class SalonSignUp extends StatefulWidget {
  @override
  _SalonSignUpState createState() => _SalonSignUpState();
}

class _SalonSignUpState extends State<SalonSignUp> {
  static const ApiKey = 'AIzaSyBKddnNMSLhLouaciQnjkOa6WcsmBtlANc';
  int _index = 0;
  bool _loading = false;
  LocationResult place;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Controllers
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController nameOfSalon = TextEditingController();
  TextEditingController typeOfSalon = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final mykey = GlobalKey<FormState>();
  final mySecondKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    onTap: (int index) {
                      // if (!mykey.currentState.validate()) return;
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
                      child: IndexedStack(
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

  signUpSalon() async {
    final model = Provider.of<AuthRepository>(context, listen: false);

    if (!mykey.currentState.validate()) {
      setState(() {
        _index = 0;
      });
      return;
    }

    if (!mySecondKey.currentState.validate()) return;
    if (place == null) return;

    bool success = await model.register(
      isCustomer: false,
      userName: name.text,
      phone: phone.text,
      email: email.text,
      password: password.text,
      nameOfSalon: nameOfSalon.text,
      // address:'${place.latLng.latitude} : ${place.latLng.longitude}',
      address: location.text
      // location.text,
    );

    if (success) {
      //go to otp page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SalonOtpScreen()));
    } else {
      //Do nothing
    }
  }

  Widget makeInput(
      {obscureText = false,
      String hint,
      TextEditingController controller,
      Function validator,
      TextInputType inputType,
      Function onTap,
      bool readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          obscureText: obscureText,
          onTap: onTap,
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          validator: validator,
          keyboardType: inputType,
          onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  _login({BuildContext context}) {
    final model = Provider.of<AuthRepository>(context);
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
                            validator: (value) => model.validateName(value))),
                    FadeAnimation(
                      1.3,
                      makeInput(
                        hint: "Phone Number",
                        controller: phone,
                        validator: (value) => model.validatePhoneNumber(value),
                      ),
                    ),
                    FadeAnimation(
                        1.4,
                        makeInput(
                            hint: "Email",
                            controller: email,
                            validator: (value) => model.validateEmail(value))),
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
            InkWell(
              onTap: () {
                if (!mykey.currentState.validate()) return;
                setState(() {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SalonLoginPage()));
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
    final model = Provider.of<AuthRepository>(context);
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
            Form(
              key: mySecondKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.4,
                        makeInput(
                            hint: "Name of Salon",
                            controller: nameOfSalon,
                            validator: (value) => model.validateName(value))),
                    FadeAnimation(
                      1.5,
                      makeInput(
                        hint: "Location",
                        obscureText: false,
                        controller: location,
                        validator: (value) => model.validateName(value),
                        readOnly: true,
                        onTap: () => onLocationTap(),

                      ),
                    ),
                    // makeInput(hint: "Name of Salon"),
                    // makeInput(hint: "Location"),
                  ],
                ),
              ),
            ),
            ResponsiveState(
              state: model.state,
              busyWidget: CircularProgressIndicator(),
              idleWidget: InkWell(
                onTap: signUpSalon,
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
          ],
        ),
      ),
    );
  }

  void onLocationTap() async {
    await Geolocator.requestPermission();
    LocationPermission status = await Geolocator.checkPermission();
    print('STATUS IS $status');
    if (status == LocationPermission.deniedForever) {
      Geolocator.openAppSettings();
      return;
    } else if (status == LocationPermission.denied) {
      return;
    }
    place = await showLocationPicker(
      context,
      '$ApiKey',
      myLocationButtonEnabled: true,
      requiredGPS: true,
      automaticallyAnimateToCurrentLocation: true,

    );
    location.text = place?.address;
    print('ADDRESS IS ${place?.address}');
    setState(() {});
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
