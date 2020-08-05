import 'package:flutter/material.dart';
import 'package:flutter_webpage/constants.dart';

class PortfolioItemWidget extends StatelessWidget {
  PortfolioItemWidget({
    this.image,
    this.title,
    this.subtitle,
  });

  final String title;
  final Image image;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xaa000000),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          leading: image,
          title: Text(
            title,
            style: kColorTextStyle,
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
