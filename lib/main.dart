import 'package:flutter/material.dart';
import 'package:cipherxtask/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          appId: "1:1060716852654:android:d2f57055751a7125c5043f",
          apiKey: "AIzaSyAdBiP3B1kVo6W-fWfZPV1t_Nbb6Ll1kWA",
          messagingSenderId: "0",
          projectId: "signupfirebase-98ee8"));
  
     prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
