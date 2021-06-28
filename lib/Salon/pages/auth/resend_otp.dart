import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/auth/otp.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';


class ResendOtpPage extends StatelessWidget {
    TextEditingController email = TextEditingController();
    GlobalKey<FormState> mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //final user = locator<UserInfoCache>();
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
                        
                           
                            Text(
                              "Resend OTP ",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                        SizedBox(
                          height: 20,
                        ),
                      
                            Text(
                              "Please enter your email address \nto get the otp again",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            ),
                      ],
                    ),
                    Form(
                          key: mykey,
                       child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                            makeInput(hint: "Email Address",
                            controller: email,
                                        validator: (value) =>
                                            model.validateName(value)),
                            
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
           
                                ],
                            ))
                          ],
                        ),
                      ),
                    ),
                         ResponsiveState(
                                  state: model.state,
                        busyWidget: CircularProgressIndicator(),
                        idleWidget: InkWell(
                            onTap: () => resendOTP(context),
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
                              "Send",
                              style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white),
                            )
                    
                      ),
                    ),
                                  ),
                         ),
                  
                  ],
                ),
              ),
              // FadeAnimation(1.2, Container(
              //   height: MediaQuery.of(context).size.height / 3,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/background.png'),
              //       fit: BoxFit.cover
              //     )
              //   ),
              // ))
            ],
          ),
        ),
      ));
    
  }

    resendOTP(context) async {
    final model = Provider.of<AuthRepository>(context, listen: false);
    if (!mykey.currentState.validate()) return;

    bool success = await model.resendOTP(
        email:email.text);

    if (success) {
      //go to otp page
      Navigator.push(context, MaterialPageRoute(builder: (context) => SalonOtpScreen()));
    } else {
      //Do nothing
    }
  }

  Widget makeInput({obscureText = false, String hint,TextEditingController controller,
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