import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocket_piano/Models/user.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/screen.dart';
import 'package:pocket_piano/Screens/Home/Practice/learn_to_play.dart';
import 'package:pocket_piano/Screens/Home/Records/records.dart';
import 'package:pocket_piano/Screens/loading.dart';
import 'package:pocket_piano/Services/database.dart';
import 'package:pocket_piano/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{ 
  static AuthService _auth = AuthService();
  //text field for state objects
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "The pocket piano",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 23.5,
          ),
        ),
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
      body: Stack(
        children: <Widget>[
          Container(
            width: 114.0,
            height: 200.0,
            child: Stack(
              children:<Widget>[
                Align(
                  alignment: Alignment(0.8,2.2),
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
                  alignment: Alignment(-33.0,2.2),
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
          Container(
            width: 114.0,
            height: 200.0,
            child: Stack(
              children:<Widget>[
                Align(
                  alignment: Alignment(9.1,5.2),
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
                  alignment: Alignment(174.0,10.0),
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
          ListView(
            children: <Widget>[
              Container(
                width: 300.0,
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
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
              StreamBuilder<DocumentSnapshot>(
                stream: Firestore.instance.collection('${user.uid}' + '1').document("Despacito").snapshots(),
                builder: (context, snapshot1) {
                  if(!snapshot1.hasData) {
                    return Container(height: 1000,);
                  }
                  int data1;
                  if(snapshot1.data.exists) {
                    data1 = snapshot1.data['score'];
                  } else {
                    data1 = 0;
                  }
                  return StreamBuilder<DocumentSnapshot>(
                    stream: Firestore.instance.collection('${user.uid}' + '1').document("We wish you a merry Christmas").snapshots(),
                    builder: (context, snapshot2) {
                      if(!snapshot2.hasData) {
                        return Container();
                      }
                      int data2;
                      if(snapshot2.data.exists) {
                        data2 = snapshot2.data['score'];
                      } else {
                        data2 = 0;
                      }
                      return StreamBuilder<DocumentSnapshot>(
                        stream: Firestore.instance.collection('${user.uid}' + '1').document("Silent night").snapshots(),
                        builder: (context, snapshot3) {
                          if(!snapshot3.hasData) {
                            return Container();
                          }
                          int data3;
                          if(snapshot3.data.exists) {
                            data3 = snapshot3.data['score'];
                          } else {
                            data3 = 0;
                          }
                          return StreamBuilder<DocumentSnapshot>(
                            stream: Firestore.instance.collection('${user.uid}' + '1').document("Nothing else matters").snapshots(),
                            builder: (context, snapshot4) {
                              if(!snapshot4.hasData) {
                                return Container();
                              }
                              int data4;
                              if(snapshot4.data.exists) {
                                data4 = snapshot4.data['score'];
                              } else {
                                data4 = 0;
                              }
                              return StreamBuilder<DocumentSnapshot>(
                                stream: Firestore.instance.collection('${user.uid}' + '1').document("Pirates of the Carribean").snapshots(),
                                builder: (context, snapshot5) {
                                if(!snapshot5.hasData) {
                                  return Container();
                                }
                                int data5;
                                if(snapshot5.data.exists) {
                                  data5 = snapshot5.data['score'];
                                } else {
                                  data5 = 0;
                                }
                                  return Center(
                                    child: Container(
                                      width: 235.0,
                                      height: 300.0,
                                      padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 15.0),
                                      child: FlatButton(
                                        onPressed: () async {
                                          await DatabaseService(uid: user.uid, name: "Despacito").updateScoreData(data1);
                                          await DatabaseService(uid: user.uid, name: "We wish you a merry Christmas").updateScoreData(data2);
                                          await DatabaseService(uid: user.uid, name: "Silent night").updateScoreData(data3);
                                          await DatabaseService(uid: user.uid, name: "Nothing else matters").updateScoreData(data4);
                                          await DatabaseService(uid: user.uid, name: "Pirates of the Carribean").updateScoreData(data5);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Practice()),
                                          );
                                        },
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              height: 190.0,
                                              child: Image(image: AssetImage('assets/note.png'))
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
                                  );
                                }
                              );
                            }
                          );
                        }
                      );
                    }
                  );
                }
              ),
              Center(
                child: Container(
                  width: 220.0,
                  height: 220.0,
                  padding: EdgeInsets.all(0.0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Records()),
                      );
                    },
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
        ],
      ),
    );
  }
}