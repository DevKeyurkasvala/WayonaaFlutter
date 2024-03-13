import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

   AppDrawer({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Home', 'route': '/dashboard'},
    {'title': 'Profile', 'route': '/profile'},
    // Add more menu items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          for (int index = 0; index < _menuItems.length; index++)
            ListTile(
              title: Text(_menuItems[index]['title']),
              onTap: () {
                onItemTapped(index);
                Navigator.pop(context);
                Navigator.pushNamed(context, _menuItems[index]['route']);
              },
              selected: selectedIndex == index,
            ),
        ],
      ),
    );
  }
}
