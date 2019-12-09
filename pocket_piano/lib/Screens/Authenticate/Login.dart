import 'package:flutter/material.dart';
import 'package:pocket_piano/services/auth.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:pocket_piano/Screens/Authenticate/SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 45.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'
                    ),
                  ),
                ),
                SizedBox(width: 140,),
                Container(
                  width: 114.0,
                  height: 200.0,
                  child: Stack(
                    children:<Widget>[
                      Align(
                        alignment: Alignment(-1.5,-0.3),
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff8B16FF),
                            boxShadow: <BoxShadow> [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(5, -5),
                                 blurRadius: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(30.4,-0.3),
                        child: Container(
                          height: 110.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff8B16FF),
                            boxShadow: <BoxShadow> [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(5, -5),
                                blurRadius: 25.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.0,),
          Center(
            child: Container(
              height: 206.0,
              width: 380.5,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow> [BoxShadow(
                  color: Colors.black38,
                  offset: Offset(2, 2),
                  blurRadius: 23.0,
                )],
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) => value.isEmpty ? "Enter an email!" : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontSize: 19.0,
                        ),
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
                      validator: (value) => value.length < 6 ? "Enter a password 6+ characters long!" : null,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 19.0,
                        ),
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
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 90.0,
                width: 200.0,
                child: Stack(
                  children: <Widget>[
                    CircularCheckBox(
                      activeColor: Color(0xff8B16FF),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      value: rememberMe,
                      onChanged: (bool value){
                        setState(() {
                          rememberMe = value;
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment(1.4, -0.75),
                      child: Text(
                        "Remember me",
                        style: TextStyle(
                          fontSize: 21.5,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ],
                ),
              ),
              Container(
                height: 100.0,
                width: 180.0,
                child: Align(
                  alignment: Alignment(3.0, -1.0),
                  child: Container(
                    height: 45.0,
                    width: 165.0,
                    child: RaisedButton(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(19.0),
                      ),
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          print(email);
                          print(password);
                        }
                      },
                      color: Color(0xff8B16FF),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 114.0,
                  height: 200.0,
                  child: Stack(
                    children:<Widget>[
                      Align(
                        alignment: Alignment(1.5,0.3),
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff8B16FF),
                            boxShadow: <BoxShadow> [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(5, -5),
                                  blurRadius: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-30.4,0.3),
                        child: Container(
                          height: 110.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff8B16FF),
                            boxShadow: <BoxShadow> [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(5, -5),
                                blurRadius: 25.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              SizedBox(width: 130.0,),
              Container(
                height: 100,
                width: 180,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SingUp())
                    );
                  },
                  color: Colors.white70,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 41.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}