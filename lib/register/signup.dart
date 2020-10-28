import 'package:MediCaP/authentication_service.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showpassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  String _email, _password;
  @override
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
                      'SignUp',
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
                              onSaved: (input) => _email = input,
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
                              onSaved: (input) => _password = input,
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
                                    setState(() => this._showpassword =
                                        !this._showpassword);
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
                          MaterialButton(
                            onPressed: () {
                              context.read<AuthenticationService>().signUp(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );
                            },
                            minWidth: 220,
                            splashColor: Colors.red[500],
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
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
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        'Already have an account',
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
}
