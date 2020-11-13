import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developers'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                            'images/businessman-profile-cartoon_18591-58479.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment(-0.8, 0),
                        child: Column(children: <Widget>[
                          Text(
                            'Name: RAHUL NAYAK',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Text(
                            'Roll.No: 19075021',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                            'images/businessman-profile-cartoon_18591-58479.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment(-0.8, 0),
                        child: Column(children: <Widget>[
                          Text(
                            'Name: SHREYAS RAJ',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Text(
                            'Roll.No: 19075074',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              height: 200,
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                        'images/businessman-profile-cartoon_18591-58479.jpg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment(-0.8, 0),
                    child: Column(children: <Widget>[
                      Text(
                        'Name: VARSHITH',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        'Roll.No: 19075057',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
