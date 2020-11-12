import 'package:flutter/material.dart';
import 'package:flutter_webpage/Models/portfolio_items.dart';
import 'package:flutter_webpage/Navbar/Navbar.dart';
import 'package:flutter_webpage/Widgets/portfolio_item_widget.dart';

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Image icon = Image.network(
    'https://scontent-lax3-2.xx.fbcdn.net/v/t1.0-9/118069686_109531690866597_6811113650699708854_n.png?_nc_cat=111&ccb=2&_nc_sid=85a577&_nc_ohc=Y9jKJdFZfbAAX9VZWxl&_nc_ht=scontent-lax3-2.xx&oh=bc62c6a97fcf69089e21923c175a805f&oe=5FD21F70',
    scale: 7,
  );
  String title = "ApoApps";

  int getNumberOfRows(constraints) {
    if (constraints.maxWidth < 650) {
      isLarge = false;
      return 1;
    } else if (constraints.maxWidth >= 650 && constraints.maxWidth < 900) {
      isLarge = true;
      return 2;
    } else if (constraints.maxWidth > 900 && constraints.maxWidth < 1300) {
      isLarge = true;
      return 3;
    } else if (constraints.maxWidth >= 1300) {
      isLarge = true;
      return 4;
    } else {
      return 1;
    }
  }

  bool isLargeDisplay(constraints) {
    if (constraints.maxWidth < 650) {
      isLarge = false;
      return false;
    } else if (constraints.maxWidth >= 650 && constraints.maxWidth < 900) {
      isLarge = true;
      return true;
    } else if (constraints.maxWidth > 900 && constraints.maxWidth < 1300) {
      isLarge = true;
      return true;
    } else if (constraints.maxWidth >= 1300) {
      isLarge = true;
      return true;
    } else {
      return true;
    }
  }

  String header = 'Historial de software:';
  bool isLarge;

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        getNumberOfRows(constraints);

        return Column(
          children: [
            Navbar(
              navIcon: icon,
              navTitle: title,
            ),
            Flexible(
              child: ListView(
                children: [
//                  Card(
////                    elevation: 20,
////                    child: Container(
////                      height: 200,
////                    ),
////                  ),
                  PortfolioBuilder(
                      numberOfRows: getNumberOfRows(constraints),
                      isLarge: isLarge),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class PortfolioBuilder extends StatelessWidget {
  PortfolioBuilder({
    @required this.numberOfRows,
    @required this.isLarge,
    this.constraints,
  });

  final int numberOfRows;
  bool isLarge;
  final BoxConstraints constraints;

  bool isLargeDisplay(constraints) {
    if (constraints.maxWidth < 650) {
      isLarge = false;
      return false;
    } else if (constraints.maxWidth >= 650 && constraints.maxWidth < 900) {
      isLarge = true;
      return true;
    } else if (constraints.maxWidth > 900 && constraints.maxWidth < 1300) {
      isLarge = true;
      return true;
    } else if (constraints.maxWidth >= 1300) {
      isLarge = true;
      return true;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLarge
        ? GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: numberOfRows,
            ),
            itemCount: portfolioItems.length,
            itemBuilder: (context, index) {
              return PortfolioItemWidget(
                constraints: constraints,
                title: portfolioItems[index].title,
                subtitle: portfolioItems[index].subtitle,
                bannerImage: portfolioItems[index].bannerImage,
                icon1: portfolioItems[index].icon1,
                icon2: portfolioItems[index].icon2,
                isAppStore: portfolioItems[index].isAppStore(),
                linkAppStore: portfolioItems[index].linkAppStore,
                linkGooglePlay: portfolioItems[index].linkGooglePlay,
                isLarge: isLarge,
                description: portfolioItems[index].description,
                icon: portfolioItems[index].image,
              );
            },
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: portfolioItems.length,
            itemBuilder: (context, index) {
              return PortfolioItemWidget(
                isLarge: isLarge,
                constraints: constraints,
                title: portfolioItems[index].title,
                subtitle: portfolioItems[index].subtitle,
                bannerImage: portfolioItems[index].bannerImage,
                icon1: portfolioItems[index].icon1,
                icon2: portfolioItems[index].icon2,
                isAppStore: portfolioItems[index].isAppStore(),
                linkAppStore: portfolioItems[index].linkAppStore,
                linkGooglePlay: portfolioItems[index].linkGooglePlay,
                description: portfolioItems[index].description,
                icon: portfolioItems[index].image,
              );
            },
          );
  }
}

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26
