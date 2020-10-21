import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class IntroPage3 extends StatefulWidget {
  @override
  _IntroPage3State createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
      
        Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'What we feature?',
                style: GoogleFonts.montserrat(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    decorationColor: Colors.yellow,
                    color: Colors.deepPurple),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              clipBehavior: Clip.none,
              child: Text(
                'This app gives you all the necessary details abouts the nearby plasma donars',
                style: GoogleFonts.shortStack(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              clipBehavior: Clip.none,
              child: Text(
                'You need to register yourself as a MediCap user',
                style: GoogleFonts.shortStack(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              clipBehavior: Clip.none,
              child: Text(
                'You can either request for plasma or donate to the needy one',
                style: GoogleFonts.shortStack(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ), 
            
            
          ],
        ),
      ],
    );
  }
}
