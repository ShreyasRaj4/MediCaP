import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          fit: BoxFit.cover,
          image: AssetImage("images/ebebef.png"),
        ), // 1st child of the stack
        Container(
          child: Column(
            children: [
              SizedBox(height: 100),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Heart-Article-Hero-1200x500.gif'),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 3),
                    color: Colors.yellow),
                child: Text(
                  'We are here to help you to get a Donar',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        letterSpacing: .5,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ), //  2nd child of the stack
      ],
    );
  }
}
