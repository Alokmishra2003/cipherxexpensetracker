import 'package:flutter/material.dart';
import 'package:cipherxtask/home.dart';
class ExpensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dynamicText = 'Expense';
    String additionalText = 'How Much';
    String additionalText2 = '₹ 0';

    double containerWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: GestureDetector(
              onTap: () {
               Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>HomePage()),
                  );
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                dynamicText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 16,
            child: Column(
              children: [
                Text(
                  additionalText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  additionalText2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    buildContainerWithIcon(
                      containerWidth,
                      'Category',
                      Icons.arrow_downward,
                    ),
                    SizedBox(height: 16),
                    buildContainerWithIcon(
                      containerWidth,
                      'Description',
                      null,
                    ),
                    SizedBox(height: 16),
                    buildContainerWithIcon(
                      containerWidth,
                      'Wallet',
                      Icons.arrow_downward,
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Add functionality for the continue button
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainerWithIcon(double width, String text, IconData? icon) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          if (icon != null)
            Icon(
              icon,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}
