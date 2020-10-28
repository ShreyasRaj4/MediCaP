import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  String filename, name, bloodgroup;
  UserProfile(String filename, String bloodgroup, String name) {
    this.filename = filename;
    this.bloodgroup = bloodgroup;
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 5.0, color: Colors.white),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(
                  filename,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    15.0, // Move to right 10  horizontally
                    15.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
          ),
          Text(
            name,
            style: GoogleFonts.lato(fontSize: 15, color: Colors.red),
          ),
          Text(
            bloodgroup,
            style: GoogleFonts.lato(fontSize: 15, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
