import 'package:MediCaP/IntroPages/page4.dart';
import 'package:flutter/material.dart';
import 'package:MediCaP/IntroPages/page1.dart';
import 'package:MediCaP/IntroPages/page2.dart';
import 'package:MediCaP/IntroPages/page3.dart';

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
                FlatButton(
                  child: Text('skip'),
                  onPressed: () {
                    print('jhi');
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
