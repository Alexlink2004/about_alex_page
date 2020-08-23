import 'package:flutter/material.dart';
import 'package:flutter_webpage/Drawer/drawer.dart';
import 'package:flutter_webpage/LandingPage/LandingPage.dart';

import 'Routes.dart';

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ApoApps',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "Montserrat",
        primaryColor: Colors.white,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      home: MyHomePage(),
      routes: routes,
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void openDrawer() {
  scaffoldKey.currentState.openEndDrawer();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: PageDrawer(),
      body: Container(
        height: double.infinity,
        child: LandingPage(),
      ),
    );
  }
}

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26
