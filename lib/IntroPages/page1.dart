import 'package:flutter/material.dart';


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
              image: AssetImage('images/Logomaker-Health_Fitness-2020916.jpg'),
            ),
          ), // First children of the stack
        ],
      ),
    );
  }
}
