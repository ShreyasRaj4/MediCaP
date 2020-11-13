import 'package:MediCaP/GetXHelper/FirebaseController.dart';
import 'package:MediCaP/home/donation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DrawerScreen extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 0),
      child: Column(
        /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */
        children: [
          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                minRadius: 30,
                backgroundImage: AssetImage(
                    'images/businessman-profile-cartoon_18591-58479.jpg'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shreyas Raj',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Active Status',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyan),
                          visualDensity:
                              VisualDensity(vertical: 4, horizontal: 0),
                        ),
                        onPressed: () {
                          switch (element['title']) {
                            case 'Donate Blood':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DonationBlood()));
                              break;
                            case 'Donate Plasma':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DonationPlasma()));
                              break;
                            case 'Rate Us':
                              print('Rate Us');
                              break;
                            case 'Share':
                              print('Share');
                              break;
                            case 'Info':
                              print('Info');
                              break;
                            case 'Logout':
                              controller.signOut();
                              break;
                            default:
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              element['icon'],
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              element['title'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.heart, 'title': 'Donate Blood'},
  {'icon': FontAwesomeIcons.heart, 'title': 'Donate Plasma'},
  {'icon': Icons.star_rate, 'title': 'Rate Us'},
  {'icon': FontAwesomeIcons.share, 'title': 'Share'},
  /* {'icon': FontAwesomeIcons.home, 'title': 'Home'}, */
  {'icon': FontAwesomeIcons.info, 'title': 'Info'},
  {'icon': Icons.logout, 'title': 'Logout'},
];
