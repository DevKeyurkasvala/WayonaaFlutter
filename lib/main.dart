import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayonaacrm/Pages/dashboard.dart';
import 'package:wayonaacrm/Pages/loginpage.dart';
import 'package:wayonaacrm/Pages/profilepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

   const MyApp({Key? key, this.isLoggedIn = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? const MyHomePage() : const MyLoginPage(),
      routes: {
        '/dashboard': (context) => const MyHomePage(),
         '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
