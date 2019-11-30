import 'package:flutter/material.dart';
import 'package:pocket_piano/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
            child: Text("Login Anon"),
            onPressed: () async {
              dynamic result = await _auth.singInAnon();
              if (result == null) {
                print("Error loging in");
              } else {
                print("Logged in");
                print(result.uid);
              }
            },
          )
        ),
      ),
    );
  }
}