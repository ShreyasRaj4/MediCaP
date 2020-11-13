import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';
import 'GetXHelper/FirebaseController.dart';
import 'package:MediCaP/InstanceBinding.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:MediCaP/register/login.dart';
import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      debugShowCheckedModeBanner: false,
      title: 'MediCap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.purple,
      ),
      home: SplashScreen(
        seconds: 5,
        routeName: "/",
        backgroundColor: Colors.white,
        image: Image.asset('images/splash.gif'),
        photoSize: 200,
        loaderColor: Colors.white,
        navigateAfterSeconds: IsSignedIn(),
      ),
    );
  }
}

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseController>().user != null ? Home() : Login();
    });
  }
}