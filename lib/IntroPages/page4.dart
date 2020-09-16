import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'What we feature?',
              style: GoogleFonts.lobster(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  decorationColor: Colors.yellow,
                  color: Colors.purple),
            ),
          );
  }
}