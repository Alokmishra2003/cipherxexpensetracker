import 'package:cipherxtask/main.dart';
import 'package:cipherxtask/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:cipherxtask/signupage.dart';

class GettingStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/img2.png', // Replace with your image asset path
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 24),
                            const Text(
                              'Welcome to \n CYPHERX',
                              style:
                                  TextStyle(fontSize: 36, color: Colors.white),
                            ),
                            const SizedBox(width: 64),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the signup page on arrow icon click
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          prefs?.getString("userId") == ""
                                              ? SignupPage()
                                              : const Navigation()),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Colors
                                      .grey, // Grey color for circular avatar background
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Welcome to the Getting Started Screen!',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
