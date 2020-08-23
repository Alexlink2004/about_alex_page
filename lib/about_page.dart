import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webpage/Navbar/Navbar.dart';

class AboutPage extends StatelessWidget {
  static String id = "About Page";

  AboutPage({
    this.title,
    this.icon,
    this.description,
    this.bannerImage,
    this.isLarge,
  });

  final String title;
  final Image icon;
  final String description;
  final String bannerImage;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> aboutItems = [
      Flexible(
        child: Image.network(bannerImage),
      ),
      Flexible(
        child: Material(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(30),
            height: 400,
            width: isLarge ? 300 : size.width * 0.8,
            child: AutoSizeText(
              description,
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 40,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Navbar(
            navIcon: icon,
            navTitle: title,
          ),
          Expanded(
            child: Container(
              child: !isLarge
                  ? ListView(
                      children: aboutItems,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: aboutItems,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
