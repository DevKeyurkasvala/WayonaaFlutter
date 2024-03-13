import 'package:flutter/material.dart';
import 'package:wayonaacrm/Pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      home: const MyHomePage(),
    );
  }
}



