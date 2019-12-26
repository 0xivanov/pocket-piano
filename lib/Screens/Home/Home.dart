import 'package:flutter/material.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/Keyboard.dart';
import 'package:pocket_piano/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  static AuthService _auth = AuthService();
  static Future<String> getEmail() async {
    dynamic result = await _auth.getUserState();
    print(result.email);
    return result.email;
  }



  //text field for state objects
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff8B16FF),
              ),
              accountName: Text("Ivan"),
              accountEmail:FutureBuilder<String>(
                  future: getEmail(),
                  builder: (context,snapshot) {
                    if(snapshot.hasData){
                      return Text(
                        snapshot.data,
                        style: TextStyle(
                          fontSize: 20.0
                        ),
                      );
                    } else{
                      return null;
                    }
                  },
                ),
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
        title: Text("Pocket Piano"),
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
      body: ListView(
        children: <Widget>[
          Container(
            width: 300.0,
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Keyboard()),
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