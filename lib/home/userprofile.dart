import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  String filename, name, bloodgroup;
  UserProfile(String filename,String name,String bloodgroup){
    this.filename=filename;
    this.name=name;
    this.bloodgroup=bloodgroup;
  } 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () => print('open profile'),
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: new BoxDecoration(
              border: Border.all(width: 5.0, color: Colors.white),
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(
                  filename,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    15.0, // Move to right 10  horizontally
                    15.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
        ),
        Text(
          bloodgroup,
          style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
