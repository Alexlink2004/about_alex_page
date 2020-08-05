import 'package:flutter/material.dart';
import 'package:flutter_webpage/Models/portfolio_items.dart';
import 'package:flutter_webpage/Widgets/portfolio_item_widget.dart';

class LandingPage extends StatelessWidget {
  List<Widget> pageChildren(double width, var size) {
    return <Widget>[
      ListWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 650) {
          return GridWidget();
        } else {
          return ListWidget();
        }
      },
    );
  }
}

class GridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: portfolioItems.length,
      itemBuilder: (context, index) {
        return PortfolioItemWidget(
          title: portfolioItems[index].title,
          subtitle: portfolioItems[index].subtitle,
          image: portfolioItems[index].image,
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
        );
      },
    );
  }
}
