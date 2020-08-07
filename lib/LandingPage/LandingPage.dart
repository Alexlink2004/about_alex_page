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
    } else if (constraints.maxWidth > 900) {
      isLarge = true;
      return 3;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style:
              TextStyle(color: Colors.white, fontSize: size.width * 0.03),
            ),
            PortfolioBuilder(
              numberOfRows: getNumberOfRows(constraints),
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
  });

  final int numberOfRows;
  final bool isLarge;

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
          isLarge: isLarge,
          title: portfolioItems[index].title,
          subtitle: portfolioItems[index].subtitle,
          image: portfolioItems[index].image,
          icon1: portfolioItems[index].icon1,
          icon2: portfolioItems[index].icon2,
        );
      },
    )
        : ListView.builder(
      shrinkWrap: true,
      itemCount: portfolioItems.length,
      itemBuilder: (context, index) {
        return PortfolioItemWidget(
          title: portfolioItems[index].title,
          subtitle: portfolioItems[index].subtitle,
          image: portfolioItems[index].image,
          icon1: portfolioItems[index].icon1,
          icon2: portfolioItems[index].icon2,
        );
      },
    );
  }
}
