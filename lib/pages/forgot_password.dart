import 'package:flutter/material.dart';
class ForgotPage extends StatelessWidget {
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
                        
                           
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                        SizedBox(
                          height: 20,
                        ),
                      
                            Text(
                              "Please enter your email address \nto get a recovery otp",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          makeInput(label: "Email Address"),
                          
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ],
                          ))
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
                            color: Color(0xfff3236e),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black)),
                        child: Text(
                          "Send",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
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

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }
}