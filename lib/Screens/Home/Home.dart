import 'package:flutter/material.dart';
import 'package:pocket_piano/Models/user.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/screen.dart';
import 'package:pocket_piano/Screens/Home/Practice/learn_to_play.dart';
import 'package:pocket_piano/Screens/Home/Records/records.dart';
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
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: Scaffold(
        key: _scaffoldKey,
          drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff8B16FF),
                ),
                accountName: Text("Ivan"),
                accountEmail: Text(user.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "P",
                    style: TextStyle(
                      color: Color(0xff8B16FF),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                trailing: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "The pocket piano",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23.5,
            ),
          ),
          backgroundColor: Color(0xff8B16FF),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
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
                Center(
                  child: Container(
                    width: 235.0,
                    height: 300.0,
                    padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 15.0),
                    child: FlatButton(
                      onPressed: () {
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
      ),
    );
  }
}