import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserProfile extends StatelessWidget {
  String name, bloodgroup, city, sex;
  UserProfile(String name, String bloodgroup, String city, String sex) {
    this.name = name;
    this.bloodgroup = bloodgroup;
    this.city = city;
    this.sex = sex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 170,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.pinkAccent[100],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.deepPurple[200]),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple[200],
                blurRadius: 1, // soften the shadow
                spreadRadius: 0.5, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 10  horizontally
                  10.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      'Name:  ',
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      name,
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      'BloodGroup:  ',
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      bloodgroup,
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      'City:  ',
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      city,
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      'Gender:  ',
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      sex,
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 180,
        )
      ],
    );
  }
}
/*  Container(
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
          ), */
