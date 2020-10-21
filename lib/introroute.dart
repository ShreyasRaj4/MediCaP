import 'package:MediCaP/IntroPages/page4.dart';
import 'package:flutter/material.dart';
import 'package:MediCaP/IntroPages/page1.dart';
import 'package:MediCaP/IntroPages/page2.dart';
import 'package:MediCaP/IntroPages/page3.dart';
import 'package:shimmer/shimmer.dart';
import 'package:MediCaP/register/login.dart';

class IntroRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: PageView(
                children: [
                  IntroPage1(),
                  IntroPage2(),
                  IntroPage3(),
                  IntroPage4(),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.black,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        elevation: 200,
                        color: Colors.transparent,
                        child: Text(
                          'Skip',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login())),
                        highlightColor: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
