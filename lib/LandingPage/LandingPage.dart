import 'package:flutter/material.dart';
import 'package:flutter_webpage/Models/portfolio_items.dart';
import 'package:flutter_webpage/Widgets/portfolio_item_widget.dart';

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

  String header = 'Historial de software:';
  bool isLarge = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
//        if (constraints.maxWidth > 650) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              isLarge ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Text(
              header,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isLarge ? size.width * 0.02 : size.width * 0.05),
            ),
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
  final bool isLarge;
  final constraints;

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
          isLarge: isLarge,
          title: portfolioItems[index].title,
          subtitle: portfolioItems[index].subtitle,
          image: portfolioItems[index].image,
          icon1: portfolioItems[index].icon1,
          icon2: portfolioItems[index].icon2,
          isAppStore: portfolioItems[index].isAppStore(),
        );
      },
    )
        : ListView.builder(
      shrinkWrap: true,
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
        );
      },
    );
  }
}
