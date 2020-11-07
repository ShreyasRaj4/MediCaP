import 'package:MediCaP/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[300],
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    'images/WhatsApp Image 2020-10-28 at 10.21.31 AM.jpeg'),
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
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          visualDensity:
                              VisualDensity(vertical: 4, horizontal: 0),
                        ),
                        onPressed: () {
                          print('sssssssssssssssssss');
                          bool isReg=true;
                          print(isReg);
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
                            Text(element['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              TextButton(
                onPressed: () {
                  print('setting');
                 
                },
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

/* List<Map> drawerItems = [
  {'icon': 'Icons.menu', 'title': 'shreyas'},
  {'icon': 'Icons.menu', 'title': 'shreyas'},
  {'icon': 'Icons.menu', 'title': 'shreyas'},
  {'icon': 'Icons.menu', 'title': 'shreyas'},
]; */
List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.heart, 'title': 'Donate'},
  {'icon': Icons.star_rate, 'title': 'Rate Us'},
  {'icon': FontAwesomeIcons.share, 'title': 'Share'},
  /* {'icon': FontAwesomeIcons.home, 'title': 'Home'}, */
  /* {'icon': Icons.favorite, 'title': 'Favorites'}, */
  {'icon': FontAwesomeIcons.info, 'title': 'Info'},
];
