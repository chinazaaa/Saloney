import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/password/change_password.dart';
import 'package:starter_project/Salon/pages/screens/about_us.dart';
import 'package:starter_project/Salon/pages/screens/editProfile.dart';
import 'package:starter_project/Salon/pages/screens/help_and_support.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';
import 'package:starter_project/core/routes/route_names.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/profile.dart';
import 'package:starter_project/Salon/pages/screens/utils/CustomTextStyle.dart';
import 'package:starter_project/models/user.dart';

import '../../../intro_page.dart';
import '../../../locator.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User user = locator<UserInfoCache>().salon.data.user;
  //  List<ListProfileSection> listSection = new List(); //FIXME List() is deprecated
  List<ListProfileSection> listSection = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
  }

  void createListItem() {
    listSection.add(createSection("Change Password", "assets/ic_settings.png",
        Colors.teal.shade800, ChangePasswordPage()));
    listSection.add(createSection("About Us", "assets/ic_about_us.png",
        Colors.black.withOpacity(0.8), AboutPage()));
    listSection.add(createSection("Help and Support", "assets/ic_support.png",
        Colors.indigo.shade800, HelpAndSupportPage()));
    listSection.add(createSection(
        "Logout", "assets/ic_logout.png", Colors.red.withOpacity(0.7), null, onPressed: () async{
          bool success = await Provider.of<AuthRepository>(context, listen: false).logout();
          if(success) Navigator.pushNamedAndRemoveUntil(context, RouteNames.introPage, (route) => false);
    }));
  }

  createSection(String title, String icon, Color color, Widget widget, {Function onPressed}) {
    return ListProfileSection(title, icon, color, widget, onPressed);
  }

  @override
  Widget build(BuildContext context) {
    final user = locator<UserInfoCache>().salon.data;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      // FIXME Made to work using ln 51 according to docs
      // resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: Builder(builder: (context) {
        return Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                      ),
                      top: -40,
                      left: -40,
                    ),
                    Positioned(
                      child: Container(
                        width: 300,
                        height: 260,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle),
                      ),
                      top: -40,
                      left: -40,
                    ),
                    Positioned(
                      child: Align(
                        child: Container(
                          width: 400,
                          height: 260,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle),
                        ),
                      ),
                      top: -40,
                      left: -40,
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  "Profile",
                  style: CustomTextStyle.textFormFieldBold
                      .copyWith(color: Colors.white, fontSize: 24),
                ),
                margin: EdgeInsets.only(top: 72, left: 24),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                    flex: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Card(
                              margin:
                                  EdgeInsets.only(top: 50, left: 16, right: 16),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 8, top: 8, right: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.logout),
                                          iconSize: 24,
                                          color: Colors.black,
                                          onPressed: () async{
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (BuildContext
                                            //                 context) =>
                                            //             ProfilePage()));

                                            bool success = await Provider.of<AuthRepository>(context, listen: false).logout();
                                            if(success) Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> IntroPage()), (route) => false);
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          color: Colors.black,
                                          iconSize: 24,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProfilePage()));
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    user.user.local.userName,
                                    style: CustomTextStyle.textFormFieldBlack
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    user.user.local.email,
                                    style: CustomTextStyle.textFormFieldMedium
                                        .copyWith(
                                            color: Colors.grey.shade700,
                                            fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    height: 2,
                                    width: double.infinity,
                                    color: Colors.grey.shade200,
                                  ),
                                  buildListView()
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: user.salon.avatar == null ? Image.asset(
                    "assets/1.png",
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ) : Image.network(
                    user.salon.avatar,
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 75,
                  ),
                  Expanded(
                    child: Container(),
                    flex: 05,
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return createListViewItem(listSection[index]);
      },
      itemCount: listSection.length,
    );
  }

  createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.teal.shade200,
        onTap: listSection.onPressed ?? () {
          if (listSection.widget != null) {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => listSection.widget));
          }
        },
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 12),
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(listSection.icon),
                width: 20,
                height: 20,
                color: Colors.grey.shade500,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                listSection.title,
                style: CustomTextStyle.textFormFieldBold
                    .copyWith(color: Colors.grey.shade500),
              ),
              Spacer(
                flex: 1,
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.grey.shade500,
              )
            ],
          ),
        ),
      );
    });
  }
}
