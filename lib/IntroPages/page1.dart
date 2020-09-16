import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('images/sweetybackground.png'),
            ),
          ), // First children of the stack
          Column(
            children: [
              SizedBox(
                height: 280,
              ), // 1st child of the coloumn
              Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome to MediCap',
                      style: GoogleFonts.lobster(
                          fontSize: 42, color: Colors.brown),
                    ),
                    Text(
                      'A Virtual Plasma donating platform',
                      style: GoogleFonts.kalam(
                          fontSize: 24, color: Colors.greenAccent),
                    ), // 2nd Child of the column
                  ],
                ),
              ),
              SizedBox(
                height: 220,
              ),
              FlatButton(
                onPressed: () {
                  print('Next page');
                },
                 color: Colors.pink,
                child: Text('next'),
              ),
            ],
          ), //Second child of the stack
        ],
      ),
    );
  }
}
