import 'dart:developer';

import 'package:cipherxtask/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cipherxtask/navigationbar.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isPasswordVisible = false;
  bool _isChecked = false;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) return null;

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  void _signOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }

  Future<void> _storeUserDataInFirestore(
      String uid, String name, String email) async {
    log("stored 1");
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'email': email,
    });
  }

  Future<void> _storeUserIdInLocalStorage(String uid) async {
    log("stored 2");

    await prefs?.setString('userId', uid);
  }

  Future<void> _navigateToHomePageWithNavBar() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Navigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_isPasswordVisible,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  checkColor: Colors.white,
                  activeColor: Colors.purple,
                ),
                SizedBox(width: 8),
                Row(
                  children: [
                    Text(
                      'I agree to the',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      ' terms and conditions',
                      style: TextStyle(fontSize: 14, color: Colors.purple),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            InkWell(
              onTap: () async {
                if (_isChecked ||
                    (_usernameController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty)) {
                  try {
                    if (_isChecked) {
                      UserCredential userCredential =
                          await _auth.createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );

                      if (userCredential.user == null) {
                        _showSnackBar("Sign-In Failed");
                        return;
                      }
                      await _storeUserDataInFirestore(userCredential.user!.uid,
                          _usernameController.text, _emailController.text);
                      await _storeUserIdInLocalStorage(
                          userCredential.user!.uid);
                      _navigateToHomePageWithNavBar();
                    } else {
                      UserCredential? userCredential =
                          await _signInWithGoogle();

                      if (userCredential != null) {
                        User user = userCredential.user!;
                        await _storeUserDataInFirestore(
                            user.uid, user.displayName ?? "", user.email ?? "");
                        await _storeUserIdInLocalStorage(user.uid);
                      } else {
                        _showSnackBar("Google Sign-In Failed");
                        return;
                      }
                    }

                    await _navigateToHomePageWithNavBar();
                  } catch (e) {
                    print("Signup Error: $e");
                    _showSnackBar("Signup Failed");
                  }
                } else {
                  _showSnackBar(
                      "Please fill in all required fields or sign up with Google.");
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'OR with',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Container(
              height: 60,
              width: 60,
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 32),
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/img4.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 32),
                  Text(
                    'Signup with Google',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
