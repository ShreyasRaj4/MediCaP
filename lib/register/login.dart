import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:MediCaP/GetXHelper/FirebaseController.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:MediCaP/register/signup.dart';

// ignore: must_be_immutable
class Login extends GetWidget<FirebaseController> {
  bool _showpassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formkey,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 50,
                    left: 120,
                    child: Container(
                      height: 150,
                      width: 150,
                      child: FlareActor(
                        'images/CBvirus',
                        animation: 'move',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 20,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    left: 20,
                    child: Text(
                      'Please login to continue.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontStyle: GoogleFonts.mavenPro().fontStyle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 310,
                    left: 10,
                    child: Container(
                      height: 290,
                      width: 370,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: TextFormField(
                              controller: _emailController,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Required'),
                                EmailValidator(errorText: 'Not a valid Email')
                              ]),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Email"),
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
                              obscureText: _showpassword,
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: this._showpassword
                                        ? Colors.indigo
                                        : Colors.orange,
                                  ),
                                  onPressed: () {
                                    /* setState(() => this._showpassword =
                                        !this._showpassword); */
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(1, 6),
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: 180,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'forgot password?',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Login clicked Event');
                              _login();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 40),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 660,
                    left: 95,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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

  void _login() {
    controller.login(_emailController.text, _passwordController.text);
  }
}
