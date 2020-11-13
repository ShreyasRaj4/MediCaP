import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  createUserData(String name, String email, String uid) async {
    return await users.doc(uid).set({'name': name, 'email': email});
  }

  final CollectionReference bloodDonars =
      FirebaseFirestore.instance.collection('bloodDonars');

  createBloodDonarData(String name, int age, String sex, int weight, int phone,
      String bloodGroup, String city, String uid) async {
    return await bloodDonars.doc(uid).set({
      'name': name,
      'age': age,
      'sex': sex,
      'weight': weight,
      'phone': phone,
      'bloodGroup': bloodGroup,
      'city': city
    });
  }

  final CollectionReference plasmaDonars =
      FirebaseFirestore.instance.collection('plasmaDonars');

  createPlasmaDonarData(String name, int age, String sex, String corona,
      int weight, int phone, String bloodGroup, String city, String uid) async {
    return await plasmaDonars.doc(uid).set({
      'name': name,
      'age': age,
      'sex': sex,
      'corona': corona,
      'weight': weight,
      'phone': phone,
      'bloodGroup': bloodGroup,
      'city': city
    });
  }
}
