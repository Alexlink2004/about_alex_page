import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webpage/Navbar/Navbar.dart';

class AboutPage extends StatelessWidget {
  static String id = "About Page";

  AboutPage({this.title, this.icon, this.description});

  final String title;
  final Image icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Navbar(
            navIcon: icon,
            navTitle: title,
          ),
          Column(
            children: [
              Material(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(30),
                  height: 400,
                  width: size.width * 0.8,
                  child: AutoSizeText(
                    description,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
