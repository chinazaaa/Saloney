import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Salon/pages/widgets/search_bar.dart';
import 'package:starter_project/Salon/pages/widgets/second_section.dart';
import 'package:starter_project/Salon/pages/widgets/tab_section.dart';
import 'package:starter_project/Salon/pages/widgets/custom_appbar.dart';
import 'package:starter_project/Salon/pages/widgets/header.dart';

class NotificationsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final _headerText = Header(isHome: false);

    final _searchBar = SearchBar();

    final _tabSection = TabSection();

    final _firstSection = Container(
      height: screenHeight * 0.35,
      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_headerText, _searchBar, _tabSection],
      ),
    );


    final _secondSection = SecondSection();

    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[_firstSection, _secondSection],
          ),
        ),
      ),
    );
  }
}