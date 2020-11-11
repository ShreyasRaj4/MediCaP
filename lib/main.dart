import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        primarySwatch: Colors.blue[300],
        accentColor: Colors.purple,
      ),
      home: IsSignedIn(),
    );
  }
}

/* class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
       
    if (firebaseUser != null) {
      return Home();
    }
    return Login();
  }
} */
class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseController>().user != null ? Home() : Login();
    });
  }
}
