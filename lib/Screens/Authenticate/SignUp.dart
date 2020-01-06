import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_piano/Screens/Loading.dart';
import 'package:pocket_piano/services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field for state objects
  String email = "";
  String password = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 45.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'
                      ),
                    ),
                  ),
                  SizedBox(width: 74,),
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
                        style: TextStyle(
                          fontSize: 19.0
                        ),
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
                      SizedBox(height: 16.0),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 19.0
                        ),
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
                        onPressed: () async {
                          if(_formKey.currentState.validate()) {
                            setState(()=> loading = true);
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            Navigator.of(context).pop();
                            if(result == null){
                              setState(() {
                                loading = false;
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(
                                      "Please supply a valid email and password!",
                                      style: TextStyle(
                                        fontSize: 25.0
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                  ),
                                );
                              });
                            }
                          }
                        },
                        color: Color(0xff8B16FF),
                        child: Text(
                          "SIGN UP",
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
                SizedBox(width: 98.0,),
                Container(
                  height: 100,
                  width: 180,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white70,
                    child: Text(
                      "Login",
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
      ),
    );
  }
}