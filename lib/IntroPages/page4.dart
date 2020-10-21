import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:MediCaP/register/login.dart';
class IntroPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white,
        Colors.red,
      ], begin: Alignment.center, end: Alignment.bottomCenter)),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          Text(
            'Who can donate?',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 45, 
                fontWeight: FontWeight.w600,
                decorationColor: Colors.yellow,
                color: Colors.black),
          ),
          SizedBox(height: 30),
          Text(
            'For plasma donation. You must have completly recoverded from COVID 19',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                decorationColor: Colors.yellow,
                color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(
            'You must be atleast 17 years old and 50 kg',
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                decorationColor: Colors.yellow,
                color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(
            'In good Health without any chronic conditions',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                decorationColor: Colors.yellow,
                color: Colors.black),
          ),
          SizedBox(height: 30),
          Container(
            width: 130.0,
            height: 43.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.9],
                colors: [
                  Color(0xff1d83ab),
                  Color(0xff0cbab8),
                ],
              ),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.purple,
              child: FlatButton(
                height: 10,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                },
                child: Text(
                  'Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
