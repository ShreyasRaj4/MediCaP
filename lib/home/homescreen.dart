import 'package:MediCaP/home/bloodbanks.dart';
import 'package:MediCaP/home/userprofile.dart';
import 'package:MediCaP/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutBack,
      duration: Duration(seconds: 1),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.1 : 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          iconSize: 40,
                          color: Colors.cyan,
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          iconSize: 40,
                          color: Colors.cyan,
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 190;
                              yOffset = 80;
                              scaleFactor = 0.8;
                              isDrawerOpen = true;
                            });
                          }),
                  Text(
                    'MEDICAP',
                    style: GoogleFonts.mavenPro(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage())),
                    child: CircleAvatar(
                      minRadius: 30,
                      backgroundImage: AssetImage(
                          'images/businessman-profile-cartoon_18591-58479.jpg'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('   Need a Plasma donar?',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.blue)),
                ),
                /* TextButton(
                  onPressed: null,
                  child: Text('See All',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.blue)),
                ) */
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('plasmaDonars')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data.docs
                        .map((e) => UserProfile(e['name'], e['bloodGroup'],
                            e['city'], e['sex'], e['phone']))
                        .toList(),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('  Need a Blood donar?',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.blue)),
                ),
                /* TextButton(
                  onPressed: null,
                  child: Text('See All',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.blue)),
                ) */
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('bloodDonars')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data.docs
                        .map((e) => UserProfile(e['name'], e['bloodGroup'],
                            e['city'], e['sex'], e['phone']))
                        .toList(),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '   Nearby Blood Banks',
                  style: GoogleFonts.lato(fontSize: 18, color: Colors.blue),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'See All',
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.blue),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BLoodBank('images/bloodbank1.jpg', 'Blood Bank of Dellas',
                      'Hyderabad', '987456321'),
                  BLoodBank('images/bloodbank2.jpg', 'Blood bank of Madras',
                      'Guntur', '98745638581'),
                  BLoodBank('images/bloodbank3.jpg', 'Maratha Blood Bank',
                      'VishakaPatnam', '981756321'),
                  BLoodBank('images/bloodbank4.jpg', 'Vijaya Blood Bank',
                      'Mumbai', '987472321'),
                  BLoodBank('images/bloodbank5.jpg', 'SLMS Blood Bank',
                      'Hyderabad', '987454321'),
                ],
              ),
            ),
            Container(
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                    'images/chart-of-blood-types-in-drops-medical-and-vector-14313368.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Shimmer.fromColors(
                baseColor: Colors.deepPurple[400],
                highlightColor: Colors.pink,
                child: Text(
                  'Made With Flutter❤',
                  style: GoogleFonts.mavenPro(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
