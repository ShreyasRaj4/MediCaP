import 'package:MediCaP/GetXHelper/FirebaseController.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

// ignore: must_be_immutable
class SignUp extends GetWidget<FirebaseController> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue[200]),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formkey,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 100,
                    left: 20,
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 20,
                    child: Text(
                      'Please SignUp to continue.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontStyle: GoogleFonts.mavenPro().fontStyle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 210,
                    left: 10,
                    child: Container(
                      height: 370,
                      width: 370,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: TextFormField(
                              controller: _userNameController,
                              autocorrect: false,
                              autofocus: false,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: 'Username'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: TextFormField(
                              controller: _emailController,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Required'),
                                EmailValidator(errorText: 'Not a valid Email')
                              ]),
                              autocorrect: false,
                              autofocus: false,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: TextFormField(
                                controller: _passwordController,
                                validator: MultiValidator([
                                  RequiredValidator(errorText: 'Required'),
                                  MinLengthValidator(6,
                                      errorText:
                                          'Should be atleast 6 charecters'),
                                  MaxLengthValidator(15,
                                      errorText: 'Should be 15 charecters Max')
                                ]),
                                obscureText: true,
                                autocorrect: false,
                                autofocus: false,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: 'Password')),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: TextFormField(
                              controller: _confPasswordController,
                              validator: (String value) {
                                if (value != _passwordController.value.text) {
                                  return 'Password do not match';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              autocorrect: false,
                              autofocus: false,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: 'Confirm Password',
                                  focusColor: Colors.red),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                            onPressed: registerUser,
                            color: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            height: 40,
                            minWidth: 150,
                            child: Text(
                              'Signup',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 700,
                    left: 80,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void registerUser() {
    controller.createUser(_userNameController.text, _emailController.text,
        _passwordController.text);
  }
}
