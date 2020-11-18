import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class UserProfile extends StatelessWidget {
  String name, bloodgroup, city, sex;
  int phone;
  UserProfile(
      String name, String bloodgroup, String city, String sex, int phone) {
    this.name = name;
    this.bloodgroup = bloodgroup;
    this.city = city;
    this.sex = sex;
    this.phone = phone;
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Card(
        elevation: 20,
        shadowColor: Colors.deepPurpleAccent,
        margin: EdgeInsets.all(10),
        color: Colors.deepPurple[400],
        child: SizedBox(
          height: 90,
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              Text(
                'Name: ${name}',
                style: GoogleFonts.alegreya(fontSize: 30, color: Colors.orange[200], fontWeight: FontWeight.w600),
              ),
              Text(
                'Blood Group: ${bloodgroup}',
                style: GoogleFonts.arvo(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      ),
      back: Card(
        elevation: 20,
        shadowColor: Colors.amber,
        margin: EdgeInsets.all(5),
        color: Colors.blue[100],
        child: Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.green,
          child: SizedBox(
            height: 122,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Phone: ${phone}',
                  style:
                      GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text('Sex: ${sex}'
                 ,
                  style:
                      GoogleFonts.lato(fontSize: 20,),
                ),
                Text(
                  'City: ${city}',
                  style:
                      GoogleFonts.lato(fontSize: 20, ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

