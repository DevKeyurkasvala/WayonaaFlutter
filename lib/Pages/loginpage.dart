import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

    Future<void> _checkLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString('user');

    if (userData != null) {
      // User is already logged in, navigate to dashboard
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

    @override
  void initState() {
    super.initState();
    _checkLoggedIn();
  }


  Future<void> _login() async {
    final String identifier = _userIdController.text;
    final String password = _passwordController.text;

    final Uri loginUri = Uri.parse('http://125.22.173.98:8000/api/users/login');

    try {
      final http.Response response = await http.post(
        loginUri,
        body: jsonEncode({'identifier': identifier, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Login successful, save user information and navigate to dashboard
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String message = responseData['message'];
        final dynamic user = responseData['user'];

        // Save user information in shared preferences
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );

        // Navigate to dashboard page
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String errorMessage = responseData['message'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to log in. Please try again later.')),
        );
      }
    } catch (error) {
      print('Error logging in: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error logging in. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = const Color(0xFFFB7C00);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/primary_logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 10),
            // Username TextField
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password TextField
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Login Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
