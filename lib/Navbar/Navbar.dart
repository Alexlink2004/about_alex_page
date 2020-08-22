import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26
class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return MobileNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
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
                  child: Image.network(
                    'https://scontent-dfw5-1.xx.fbcdn.net/v/t1.0-9/118069686_109531690866597_6811113650699708854_n.png?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=9FNOjFR7wjkAX9u20Z6&_nc_ht=scontent-dfw5-1.xx&oh=b6337e775703988ae06fa7cefe8ed14e&oe=5F6755F0',
                    scale: 7,
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Text(
                  "ApoApps",
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                'https://scontent-dfw5-1.xx.fbcdn.net/v/t1.0-9/118069686_109531690866597_6811113650699708854_n.png?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=9FNOjFR7wjkAX9u20Z6&_nc_ht=scontent-dfw5-1.xx&oh=b6337e775703988ae06fa7cefe8ed14e&oe=5F6755F0',
                scale: 9,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 4,
              child: Column(children: <Widget>[
                AutoSizeText(
                  "ApoApps",
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),

//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      SizedBox(
//                        width: 30,
//                      ),
//                      AutoSizeText(
//                        "Acerca de mi",
//                        style: TextStyle(color: Colors.black),
//                        softWrap: true,
//                      ),
//                      SizedBox(
//                        width: 30,
//                      ),
//                      AutoSizeText(
//                        "Portafolio",
//                        overflow: TextOverflow.visible,
//                        style: TextStyle(color: Colors.black),
//                        softWrap: true,
//                      ),
//                    ],
//                  ),
//                )
              ]),
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
