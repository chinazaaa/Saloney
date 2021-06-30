import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/screens/profile.dart';
import 'package:starter_project/core/repositories/profile_repositories.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';

class ChangePasswordPage extends StatelessWidget {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> mykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileRepo>(context);
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
                            "Change Password",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Enter your new password",
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
                              makeInput(
                                  hint: "Old Password",
                                  controller: oldPassword,
                                  validator: (value) =>
                                      model.validatePassword(value),
                                  obscureText: true),
                              makeInput(
                                  hint: "New Password",
                                  controller: newPassword,
                                  validator: (value) =>
                                      model.validatePassword(value),
                                  obscureText: true),
                              makeInput(
                                  hint: "Confirm Password",
                                  controller: confirmPassword,
                                  validator: (value) => value == newPassword.text
                                ? null
                                : "Passwords do not match",
                                  obscureText: true),
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[],
                              ))
                            ],
                          ),
                        ),
                      ),
                      ResponsiveState(
                        state: model.state,
                        busyWidget: CircularProgressIndicator(),
                        idleWidget: InkWell(
                          onTap: () => changePassword(context),
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
                                "Change Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  changePassword(context) async {
    final model = Provider.of<ProfileRepo>(context, listen: false);
    if (!mykey.currentState.validate()) return;

    bool success = await model.changeSalonPassword(
      oldPassword: oldPassword.text, newPassword: newPassword.text, confirmPassword: confirmPassword.text,
    );

    if (success) {
      Get.snackbar(
        'Success!',
        'User Password Changed',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));
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
