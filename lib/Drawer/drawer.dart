import 'package:flutter/material.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Acerca de mi'),
            ),
          ),
        ],
      ),
    );
  }
}
