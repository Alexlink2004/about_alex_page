import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webpage/main.dart';
import 'package:url_launcher/url_launcher.dart';

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26

class Navbar extends StatelessWidget {
  Navbar({
    this.navIcon,
    this.navTitle,
  });

  final Image navIcon;
  final String navTitle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar(
            navIcon: navIcon,
            navTitle: navTitle,
          );
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar(
            navIcon: navIcon,
            navTitle: navTitle,
          );
        } else {
          return MobileNavbar(
            navIcon: navIcon,
            navTitle: navTitle,
          );
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  DesktopNavbar({
    this.navIcon,
    this.navTitle,
  });

  final Image navIcon;
  final String navTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: navIcon,
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Text(
                  navTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Acerca de mi",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 30,
                ),

                Text(
                  "Portafolio",
                  style: TextStyle(color: Colors.black),
                ),

                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () => launch('https://github.com/Alexlink2004'),
                  child: Image.asset(
                    'assets/images/github.png',
                    scale: 6,
                  ),
                ),

//                MaterialButton(
//                  color: Colors.pink,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                  onPressed: () {},
//                  child: Text(
//                    "Get Started",
//                    style: TextStyle(color: Colors.white),
//                  ),
//                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  MobileNavbar({
    this.navIcon,
    this.navTitle,
  });

  final Image navIcon;
  final String navTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: navIcon,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(children: <Widget>[
                  AutoSizeText(
                    navTitle,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ]),
              ],
            ),
            FlatButton(
              child: Icon(
                Icons.format_list_bulleted,
                color: Colors.black,
              ),
              onPressed: () {
                openDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26
