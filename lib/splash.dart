import 'dart:async';
import 'package:cipherxtask/getting.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Add a delay of 1.5 seconds using a Timer
    Timer(
      Duration(seconds: 3, milliseconds: 500),
      () {
        // Navigate to another page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GettingStarted()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/img1.png', // Replace with your image asset path
            fit: BoxFit.cover,
          ),
          
        ],
      ),
    );
  }
}