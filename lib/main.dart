import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayonaacrm/Pages/dashboard.dart';
import 'package:wayonaacrm/Pages/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual authentication logic
    bool isLoggedIn = false; // Set to true if the user is logged in

    return MaterialApp(
  routes: {
    '/': (context) => const MyLoginPage(), // Define the route for the root of your app
    '/dashboard': (context) => const MyHomePage(), // Define the route for the dashboard
  },
);

  }
}
