import 'package:flutter/material.dart';
import 'package:flutter_webpage/Models/portfolio_items.dart';
import 'package:flutter_webpage/Widgets/portfolio_item_widget.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> pageChildren(double width, var size) {
    return <Widget>[
      ListWidget(),
    ];
  }

  int getNumberOfRows(constraints) {
    if (constraints.maxWidth >= 650 && constraints.maxWidth < 1100) {
      return 3;
    } else if (constraints.maxWidth > 1100) {
      return 5;
    }
  }

  String header = 'Portafolio de software:';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 650) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                header,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              GridWidget(
                numberOfRows: getNumberOfRows(constraints),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Text(
                header,
                style: TextStyle(color: Colors.white),
              ),
              ListWidget(),
            ],
          );
        }
      },
    );
  }
}

class GridWidget extends StatelessWidget {
  GridWidget({@required this.numberOfRows});

  final int numberOfRows;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: numberOfRows,
      ),
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

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
