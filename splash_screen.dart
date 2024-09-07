import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage widget

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 66, 19), // Customize splash screen background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logoapp.png', // Path to the image in assets
              width: 150, // Adjust the size of the image
              height: 150,
            ),
            const SizedBox(height: 20), // Space between the image and text
            const Text(
              'CoffeeCraft',
              style: TextStyle(
                fontSize: 48, // Increased font size
                fontWeight: FontWeight.bold, // Bold text
                color: Colors.white, // Change text color to white for better contrast
              ),
            ),
          ],
        ),
      ),
    );
  }
}
