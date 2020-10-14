import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocket_piano/Models/user.dart';
import 'package:pocket_piano/Screens/Home/Practice/notes.dart';
import 'package:pocket_piano/Screens/Home/Practice/play_song.dart';
import 'package:pocket_piano/Screens/Home/Practice/song_provider.dart';
import 'package:pocket_piano/Screens/loading.dart';
import 'package:provider/provider.dart';

class Practice extends StatefulWidget {
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Color(0xff8B16FF),
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Learn To Play",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26.5,
                ),
              ),
              background: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/practice.png')
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                StreamBuilder(
                  stream: Firestore.instance.collection('${user.uid}' + '1').document("We wish you a merry Christmas").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      return Loading();
                    }
                    else {
                      return Container(
                        height: 180.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "We wish you a merry Christmas",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              "Complete: ${snapshot.data['score'].toString()}%",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400
                              )
                            ),
                            RaisedButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              color: Color(0xff8B16FF),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Practice",
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  )
                                ),
                              ),
                              onPressed: (){
                                List<Note> notes = initNotes1();
                                int notCountedPoints = 4;
                                int tempo = 700;
                                double keyWidth = 80;
                                String firstKey = "E3";
                                String lastKey = "F4";
                                String name = "We wish you a merry Christmas";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PlaySong(
                                    notes: notes, notCountedPoints: notCountedPoints, tempo: tempo, keyWidth: keyWidth, firstKey: firstKey, lastKey: lastKey, name: name)),
                                );
                              }
                            )
                          ],
                        ),
                      );
                    }
                  }
                ),
                SizedBox(height: 10.0),
                StreamBuilder(
                  stream: Firestore.instance.collection('${user.uid}' + '1').document("Silent night").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      return Loading();
                    }
                    else {
                      return Container(
                        height: 180.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Silent night",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              "Complete: ${snapshot.data['score'].toString()}%",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400
                              )
                            ),
                            RaisedButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              color: Color(0xff8B16FF),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Practice",
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  )
                                ),
                              ),
                              onPressed: (){
                                List<Note> notes = initNotes2();
                                int notCountedPoints = 12;
                                int tempo = 800;
                                double keyWidth = 60;
                                String firstKey = "B2";
                                String lastKey = "F4";
                                String name = "Silent night";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PlaySong(
                                    notes: notes, notCountedPoints: notCountedPoints, tempo: tempo, keyWidth: keyWidth, firstKey: firstKey, lastKey: lastKey, name: name)),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    }
                  }
                ),
                SizedBox(height: 10.0),
                StreamBuilder(
                  stream: Firestore.instance.collection('${user.uid}' + '1').document("Nothing else matters").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      return Loading();
                    }
                    else {
                      return Container(
                        height: 180.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Nothing else matters",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              "Complete: ${snapshot.data['score'].toString()}%",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400
                              )
                            ),
                            RaisedButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              color: Color(0xff8B16FF),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Practice",
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  )
                                ),
                              ),
                              onPressed: (){
                                List<Note> notes = initNotes3();
                                int notCountedPoints = 31;
                                int tempo = 500;
                                double keyWidth = 50;
                                String firstKey = "G2";
                                String lastKey = "G4";
                                String name = "Nothing else matters";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PlaySong(
                                    notes: notes, notCountedPoints: notCountedPoints, tempo: tempo, keyWidth: keyWidth, firstKey: firstKey, lastKey: lastKey, name: name, )),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    }
                  }
                ),
                SizedBox(height: 10.0),
                StreamBuilder(
                 stream: Firestore.instance.collection('${user.uid}' + '1').document("Pirates of the Carribean").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      return Loading();
                    }
                    else {
                      return Container(
                        height: 180.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Pirates of the Carribean",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              "Complete: ${snapshot.data['score'].toString()}%",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400
                              )
                            ),
                            RaisedButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              color: Color(0xff8B16FF),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Practice",
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  )
                                ),
                              ),
                              onPressed: (){
                                List<Note> notes = initNotes4();
                                int notCountedPoints = 7;
                                int tempo = 470;
                                double keyWidth = 60;
                                String firstKey = "F3";
                                String lastKey = "C5";
                                String name = "Pirates of the Carribean";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PlaySong(
                                    notes: notes, notCountedPoints: notCountedPoints, tempo: tempo, keyWidth: keyWidth, name: name, firstKey: firstKey, lastKey: lastKey, )),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    }
                  }
                ),
                SizedBox(height: 10.0,),
                StreamBuilder(
                 stream: Firestore.instance.collection('${user.uid}' + '1').document("Despacito").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      return Loading();
                    }
                    else {
                      return Container(
                        height: 180.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Despacito",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              "Complete: ${snapshot.data['score'].toString()}%",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400
                              )
                            ),
                            RaisedButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              color: Color(0xff8B16FF),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Practice",
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  )
                                ),
                              ),
                              onPressed: (){
                                List<Note> notes = initNotes5();
                                int notCountedPoints = 23;
                                int tempo = 450;
                                double keyWidth = 60;
                                String firstKey = "B3";
                                String lastKey = "F5";
                                String name = "Despacito";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PlaySong(
                                    notes: notes, notCountedPoints: notCountedPoints, tempo: tempo, keyWidth: keyWidth, name: name, firstKey: firstKey, lastKey: lastKey, )),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    }
                  }
                ),
              ]
            )
          )
        ],
      )
    );
  }
}