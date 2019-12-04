import 'package:flutter/material.dart';
import 'package:pocket_piano/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  String email = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 45.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 50.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 10.0,
                child: Container(
                  height: 180.0,
                  width: 380.5,
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff8B16FF),
                                width: 2.0,
                              ),
                            ),
                            icon: Icon(
                              Icons.email,
                              color: Color(0xff8B16FF),
                            )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff8B16FF),
                                width: 2.0,
                              ),
                            ),
                            icon: Icon(
                              Icons.vpn_key,
                              color: Color(0xff8B16FF),
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 180.0,
                child: Align(
                  alignment: Alignment(2.6, -1.0),
                  child: Container(
                    height: 45.0,
                    width: 160.0,
                    child: RaisedButton(
                      elevation: 15.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(19.0),
                      ),
                      onPressed: () {
                        print(email);
                        print(password);
                      },
                      color: Color(0xff8B16FF),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}