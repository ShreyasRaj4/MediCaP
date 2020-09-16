import 'package:flutter/material.dart';
import './introroute.dart';
import './homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;
    return MaterialApp(
      title: 'MediCap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (isLoggedIn) ? IntroRoute() : HomeScreen(),
    );
  }
}
