import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/auth/login.dart';
import 'package:starter_project/Customer/pages/auth/resend_otp.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';
import 'package:starter_project/infrastructure/user_info_cache.dart';

import '../../../locator.dart';

class CustomerOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = locator<UserInfoCache>();
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
                          Text(
                            "Enter OTP to activate your account",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Please enter the code we just sent to ${user.customerReg.data.email}",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: PinEntryTextField(
                          //  showFieldAsBox: true,
                          onSubmit: (String pin) async {

                            //compare OTP
                            if(pin != user.customerReg.data.otp.toString()){
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Incorrect OTP"),
                                      content: Text('Please confirm your Otp and try again.'),
                                    );
                                  }); //end showDialog()
                              return;
                            }

                            //if pin is correct, verify user
                            bool success = await model.confirmOTP(isCustomer: true, otp: pin);

                            if(success){
                              //go to login screen
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>CustomerLoginPage()));
                              Get.snackbar(
                                'Success',
                                'Account has been verified',
                                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                                snackStyle: SnackStyle.FLOATING,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.black26,
                              );
                            }

                            // showDialog(
                            //     context: context,
                            //     //has to be removed when backend is in place
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: Text("Pin"),
                            //         content: Text('Pin entered is $pin'),
                            //       );
                            //     }); //end showDialog()
                          }, // end onSubmit
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
                            "Continue",
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
                          Text("Didn't receive a code?"),
                     InkWell(
                              onTap: () {
                                //resend OTP
                                Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CustomerResendOtpPage()));
                              },
                              child: Text(
                                "Resend",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
