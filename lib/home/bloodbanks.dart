import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BLoodBank extends StatelessWidget {
  String filename;
  String name;
  BLoodBank(String filename,String name) {
    this.filename = filename;
    this.name=name;
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
