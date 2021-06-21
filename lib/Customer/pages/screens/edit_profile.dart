import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/screens/profile.dart';
import 'package:starter_project/core/repositories/profile_repositories.dart';
import 'package:starter_project/infrastructure/user_info_cache.dart';

import '../../../locator.dart';

class EditCustomerProfilePage extends StatefulWidget {
  @override
  _EditCustomerProfilePageState createState() =>
      _EditCustomerProfilePageState();
}

class _EditCustomerProfilePageState extends State<EditCustomerProfilePage> {
  bool showPassword = false;
  TextEditingController _usernameC = TextEditingController(
    text: locator<UserInfoCache>().customer.data.userName);
  // TextEditingController _passwordC = TextEditingController();
  TextEditingController _phoneC = TextEditingController(
    text: locator<UserInfoCache>().customer.data.phone.toString());
    final formKey = GlobalKey<FormState>();
  //final customerFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   // final model = Provider.of<ProfileRepo>(context, listen: false);
        final profileC = Provider.of<ProfileRepo>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CustomerProfile()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Color(0xff9477cb),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              SingleChildScrollView(
              child: Form (
                key: formKey,
                child: Column(
                    children: [
                buildTextField("Username", false, _usernameC,),
                buildTextField("Phone Number", false, _phoneC,),
                
                SizedBox(
                  height: 35,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {Navigator.pop(context);},
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                    ElevatedButton(
                      onPressed: () async{
                      //update profile
                                            if (!formKey.currentState.validate())
                                            return;
                                          bool success = await profileC
                                              .updateCustomerProfile(
                                                  _usernameC.text,

                                                  // email.text,
                                                  _phoneC.text);
                                          if (success) {
                                            Navigator.pop(context);
                                            Get.snackbar(
                                              'Success!',
                                              'Customer Profile Updated',
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 30, horizontal: 30),
                                              snackStyle: SnackStyle.FLOATING,
                                              snackPosition: SnackPosition.BOTTOM,
                                              backgroundColor: Colors.black26,
                                            );
                                          }  
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff9477cb),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                     ],
                ),
                  ],
                  
                ),
               
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        obscureText: isPasswordTextField ? showPassword : false,
        controller: controller,
        // validator: validator,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            // hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
