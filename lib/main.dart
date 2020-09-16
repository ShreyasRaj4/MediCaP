import 'package:flutter/material.dart';
import './introroute.dart';
import './homescreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    return MaterialApp(
      title: 'MediCap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: Colors.white,
        nextScreen: (isLoggedIn)? HomeScreen(): IntroRoute(),
        duration: 3000,
        centered: true,
        splash: Container(
          height: 5000,
          width: 5000,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('images/78e826ca1b9351214dfdd5e47f7e2024.gif'),
          ),
        ),
      ),
    );
  }
}
