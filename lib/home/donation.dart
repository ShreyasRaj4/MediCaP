import 'package:MediCaP/database/databaseManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DonationBlood extends StatefulWidget {
  @override
  _DonationBloodState createState() => _DonationBloodState();
}

class _DonationBloodState extends State<DonationBlood> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _sex = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _bloodGroup = TextEditingController();
  final TextEditingController _city = TextEditingController();

  CollectionReference bloodDonars =
      FirebaseFirestore.instance.collection('bloodDonars');

  User user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Registration Form'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'For Blood Donation',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Age',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _sex,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Sex',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Weight',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Phone',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _bloodGroup,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'BloodGroup',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _city,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'City',
                ),
              ),
            ),
            RaisedButton(
              onPressed: () async {
                await DatabaseManager().createBloodDonarData(
                    _name.text,
                    int.parse(_age.text),
                    _sex.text,
                    int.parse(_weight.text),
                    int.parse(_phone.text),
                    _bloodGroup.text,
                    _city.text,
                    user.uid);
              },
              child: Text('Be A Donar'),
            ),
          ],
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

class DonationPlasma extends StatefulWidget {
  DonationPlasma({Key key}) : super(key: key);

  @override
  _DonationPlasmaState createState() => _DonationPlasmaState();
}

class _DonationPlasmaState extends State<DonationPlasma> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _sex = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _bloodGroup = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _coronaPoss = TextEditingController();

  CollectionReference plasmaDonars =
      FirebaseFirestore.instance.collection('plasmaDonars');

  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Registration Form'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'For Plasma Donation',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Age',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _sex,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Sex',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _coronaPoss,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Did you test +ve for COVID?(y/n)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Weight',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Phone',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _bloodGroup,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'BloodGroup',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _city,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'City',
                ),
              ),
            ),
            RaisedButton(
              onPressed: () async {
                await DatabaseManager().createPlasmaDonarData(
                    _name.text,
                    int.parse(_age.text),
                    _sex.text,
                    _coronaPoss.text,
                    int.parse(_weight.text),
                    int.parse(_phone.text),
                    _bloodGroup.text,
                    _city.text,
                    user.uid);
              },
              child: Text('Be A LifeSaver'),
            ),
          ],
        ),
      ),
    );
  }
}
