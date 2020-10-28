import 'package:MediCaP/authentication_service.dart';
import 'package:MediCaP/register/resistration.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showpassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              width: 100,
              margin: EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'MediCaP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Account login',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline_outlined),
                  labelText: 'Email ID',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 30,
              ),
              child: TextField(
                controller: passwordController,
                obscureText: _showpassword,
                decoration: InputDecoration(
                  labelText: 'password',
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showpassword ? Colors.indigo : Colors.orange,
                    ),
                    onPressed: () {
                      setState(() => this._showpassword = !this._showpassword);
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 30,
              ),
              child: RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                child: Text(
                  'log in',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.redAccent,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('forget password'),
                  ),
                  Expanded(
                    flex: 0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ),
                        );
                      },
                      child: Text('Register Account'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
