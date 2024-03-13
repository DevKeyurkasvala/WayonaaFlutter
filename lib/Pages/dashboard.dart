import 'package:flutter/material.dart';
import 'package:wayonaacrm/Pages/loginpage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyLoginPage()),
            );
          },
          child: const Text('Go to Login Page'),
        ),
      ),
    );
  }
}