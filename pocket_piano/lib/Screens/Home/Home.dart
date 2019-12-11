import 'package:flutter/material.dart';
import 'package:pocket_piano/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pocket Piano"),
        backgroundColor: Color(0xff8B16FF),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text("Sign Out"),                        
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 300.0,
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage('assets/piano.png')),
                    SizedBox(height: 5.0,),
                    Text(
                      "Keyboard",
                      style: TextStyle(
                        fontSize: 30.0
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 235.0,
              height: 300.0,
              padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 15.0),
              child: FlatButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      child: Image(image: AssetImage('assets/Note.png'))
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      "Learn to play",
                      style: TextStyle(
                        fontSize: 30.0
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 220.0,
              height: 220.0,
              padding: EdgeInsets.all(0.0),
              child: FlatButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 160.0,
                      child: Image(image: AssetImage('assets/records.png'))
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      "Records",
                      style: TextStyle(
                        fontSize: 30.0
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}