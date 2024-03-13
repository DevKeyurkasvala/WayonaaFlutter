import 'package:flutter/material.dart';
import 'package:wayonaacrm/Pages/app.drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      drawer: AppDrawer(
        selectedIndex: 1, // Set selectedIndex to 1 to highlight the Profile menu item
        onItemTapped: (index) {
          // You can add navigation logic here if needed
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to your Profile!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
