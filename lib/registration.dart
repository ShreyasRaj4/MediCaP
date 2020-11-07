import 'package:MediCaP/home/home.dart';
import 'package:MediCaP/models.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            B1.onprsed();
            print(B1.isRegistered);
            /* Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home())); */
          },
        ),
      ),
    );
  }
}
