import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BLoodBank extends StatelessWidget {
  String filename;
  String name;
  String city;
  String phone;
  BLoodBank(String filename, String name, String city, String phone) {
    this.filename = filename;
    this.name = name;
    this.city = city;
    this.phone = phone;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            child: Image.asset(filename),
            borderRadius: BorderRadius.circular(10),
          ),
          Text(
            name,
            style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
          ),
          Text(
            city,
            style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
          ),
          Text(
            phone,
            style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
