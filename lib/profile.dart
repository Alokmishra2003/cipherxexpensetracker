import 'package:flutter/material.dart';
import 'package:cipherxtask/signupage.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.purple,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/img3.png'),
                      radius: 35,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Khushi Ranjan',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  ContainerWithIcon(
                    text: 'Account',
                    icon: Icons.account_circle,
                    iconColor: Colors.purple,
                  ),
                  ContainerWithIcon(
                    text: 'Setting',
                    icon: Icons.settings,
                    iconColor: Colors.purple,
                  ),
                  ContainerWithIcon(
                    text: 'Export Data',
                    icon: Icons.cloud_download,
                    iconColor: Colors.purple,
                  ),
                  ContainerWithIcon(
                    text: 'Log Out',
                    icon: Icons.exit_to_app,
                    iconColor: Colors.red,
                    onTap: () {
                      // Handle logout here, for example, navigate to the login screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
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

class ContainerWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const ContainerWithIcon({
    required this.text,
    required this.icon,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(text),
      onTap: onTap,
    );
  }
}
