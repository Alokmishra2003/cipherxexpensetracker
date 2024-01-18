import 'package:flutter/material.dart';
class Budget extends StatelessWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget'),
      ),
      body: Center(
        child: Text('Budget Page Content'),
      ),
    );
  }
}