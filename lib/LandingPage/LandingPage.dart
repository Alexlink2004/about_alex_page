import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webpage/Models/portfolio_items.dart';
import 'package:flutter_webpage/Widgets/portfolio_item_widget.dart';

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> pageChildren(double width, var size) {
    return <Widget>[];
  }

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
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        getNumberOfRows(constraints);
//        if (constraints.maxWidth > 650) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
          isLarge ? CrossAxisAlignment.center : CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 4.0,
              color: Color(0x66ffffff),
              child: Container(
                width: !isLarge ? size.width : 700,
                height: size.height * .6,
                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Acerca de mi',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    SizedBox(
                      height: 20,
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/image rara.jpg',
                        scale: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: AutoSizeText(
                        'Hola, mi nombre es Alejandro Apodaca, soy Estudiante de bachillerato entusiasta y autodidacta en programación y automatización, apasionado por el desarrollo de soluciones prácticas especialmente en aquellas que ayudan a las personas a mejorar su vida.',
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            wordSpacing: 2,
                            height: 1.20),
                        maxLines: !isLarge ? 6 : 6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * .05),
            Text(
              header,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isLarge ? size.width * 0.02 : size.width * 0.05),
            ),
            SizedBox(height: size.height * .05),
            PortfolioBuilder(
              numberOfRows: getNumberOfRows(constraints),
              constraints: constraints,
              isLarge: isLarge,
            ),
          ],
        );
//        } else {
//          return Column(
//            children: [
//              Text(
//                header,
//                style:
//                    TextStyle(color: Colors.white, fontSize: size.width * 0.05),
//              ),
//              ListWidget(),
//            ],
//          );
//        }
      },
    );
  }
}

class PortfolioBuilder extends StatelessWidget {
  PortfolioBuilder({
    @required this.numberOfRows,
    @required this.isLarge = false,
    this.constraints,
  });

  final int numberOfRows;
  bool isLarge;
  final constraints;

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
                image: portfolioItems[index].image,
                icon1: portfolioItems[index].icon1,
                icon2: portfolioItems[index].icon2,
                isAppStore: portfolioItems[index].isAppStore(),
                linkAppStore: portfolioItems[index].linkAppStore,
                linkGooglePlay: portfolioItems[index].linkGooglePlay,
                isLarge: isLarge,
                description: portfolioItems[index].description,
              );
            },
          )
        : SingleChildScrollView(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: portfolioItems.length,
        itemBuilder: (context, index) {
          return PortfolioItemWidget(
            isLarge: isLarge,
            constraints: constraints,
            title: portfolioItems[index].title,
            subtitle: portfolioItems[index].subtitle,
            image: portfolioItems[index].image,
            icon1: portfolioItems[index].icon1,
            icon2: portfolioItems[index].icon2,
            isAppStore: portfolioItems[index].isAppStore(),
            linkAppStore: portfolioItems[index].linkAppStore,
            linkGooglePlay: portfolioItems[index].linkGooglePlay,
            description: portfolioItems[index].description,
          );
        },
      ),
    );
  }
}

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26
