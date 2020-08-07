import 'package:flutter/material.dart';
import 'package:flutter_webpage/constants.dart';

class PortfolioItemWidget extends StatelessWidget {
  PortfolioItemWidget({
    this.image,
    this.title,
    this.subtitle,
    this.icon2,
    this.icon1,
    this.isLarge = false,
  });

  final String title;
  final Image image;
  final String subtitle;
  final IconData icon1;
  final IconData icon2;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xaa000000),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: !isLarge
              ? ListTile(
            leading: ClipOval(child: image),
            title: Text(
              title,
              style:
              kColorTextStyle.copyWith(fontSize: size.width * 0.04),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(color: Colors.grey),
            ),
            trailing: !isLarge
                ? Icon(
              icon1,
            )
                : Material(),
          )
              : Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xd000000),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                    ),
                  ),
                  child: Center(child: ClipOval(child: image)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: kColorTextStyle.copyWith(
                      fontSize: size.width * 0.04),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
