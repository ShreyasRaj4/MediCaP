import 'package:MediCaP/database/databaseManager.dart';
import 'package:MediCaP/home/home.dart';
import 'package:MediCaP/register/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User> _firebaseUser = Rx<User>();

  String get user => _firebaseUser.value?.email;
  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      User user = value.user;
      await DatabaseManager().createUserData(name, email, user.uid);
      Get.offAll(Home());
    }).catchError(
      (onError) =>
          Get.snackbar('Error while creating account', onError.message),
    );
  }

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(Home()))
        .catchError(
          (onError) => Get.snackbar('Error while login', onError.message),
        );
  }

  void signOut() async {
    await _auth.signOut().then((value) => Get.offAll(Login()));
  }
}

// Future<String> signUp(String name,String email,String password) async {
//     try{
//       UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//       User user =result.user;
//       await DatabaseManager().createUserData(name, 'Male', 18, user.uid);
//       return "Signed Up";
//     } on FirebaseAuthException catch(e){
//       return e.message;
//     }
//   }
