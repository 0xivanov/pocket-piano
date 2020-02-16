import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:pocket_piano/Models/user.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/Piano/piano_octave.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/midi_sound.dart';
import 'package:pocket_piano/Screens/Home/Practice/line.dart';
import 'package:pocket_piano/Screens/Home/Practice/notes.dart';
import 'package:pocket_piano/Services/database.dart';
import 'package:provider/provider.dart';


class PlaySong extends StatefulWidget {
  final List<Note> notes;
  final int notCountedPoints;
  final int tempo;
  final double keyWidth;
  final String firstKey;
  final String lastKey;
  final String name;
  PlaySong({ Key key, this.notes, this.notCountedPoints, this.tempo, this.keyWidth, this.firstKey, this.lastKey, this.name}) : super (key: key);
  @override
  _PlaySongState createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> with SingleTickerProviderStateMixin {

  ScrollController  _controller = ScrollController();
  ScrollController  _controller2 = ScrollController();
  int currentNoteIndex = 0;
  AnimationController animationController;
  int index;
  NoteState noteState;
  int _score = 0;
  bool isFast = true;
  double tileWidth;

  double getTileWidth () {
    if(widget.keyWidth == 80) return 45;
    if(widget.keyWidth == 60) return widget.keyWidth / 1.8;
    if(widget.keyWidth == 50) return widget.keyWidth / 1.81;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: widget.tempo));
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!(currentNoteIndex == widget.notes.length - 4)) {
          setState(() => ++currentNoteIndex);
          animationController.forward(from: -10);
        }
      }
    });
    _loadSoundFont();
  }

  void _loadSoundFont() async {
    FlutterMidi.unmute();
    rootBundle.load("assets/sf2/Piano.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "Piano.sf2");
    });
  }

  @override
  void dispose() {
    noteState = NoteState.ready;
    animationController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
      stream: Firestore.instance.collection('${user.uid}' + '1').document("${widget.name}").snapshots(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              snapshot.data['score'] == 100 ? "Completed" : "Score : $_score points out of ${widget.notes.length - widget.notCountedPoints}. Position between ${widget.firstKey} and ${widget.lastKey}",
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
            backgroundColor: Color(0xff8B16FF),
            leading: FlatButton(
            onPressed: () async {
              MidiSound.midiSeconds.clear();
              MidiSound.midiSounds.clear();
              if(snapshot.data['score'] != 100){
                await DatabaseService(uid: user.uid, name: widget.name).updateScoreData((_score / (widget.notes.length - widget.notCountedPoints) * 100).round());
              } 
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              label: isFast ? Text("Fast") : Text("Slow"),
              icon: Icon(Icons.slow_motion_video),
              onPressed: (){
                if(isFast) {
                  setState(() {
                    isFast = !isFast;
                    animationController.duration = Duration(milliseconds: widget.tempo + 300);
                  });
                }
                else {
                  setState(() {
                    isFast = !isFast;
                    animationController.duration = Duration(milliseconds: widget.tempo);
                  });
                }
              },
            ),
            FlatButton.icon(
              label: Text("Start"),
              icon: Icon(Icons.fast_forward),
              onPressed: (){
                animationController.forward();
              },
            ),
            FlatButton.icon(
              label: Text("Stop"),
              icon: Icon(Icons.stop),
              onPressed: (){
                animationController.stop();
              },
            ),
          ],
          ),
          body: SafeArea(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if(_controller2.offset < 2348 && widget.keyWidth == 60) {
                  _controller.jumpTo(_controller2.offset);
                }
                if(widget.keyWidth == 80) {
                  _controller.jumpTo(_controller2.offset);
                }
                if(_controller2.offset < 3000 && widget.keyWidth == 50) {
                  _controller.jumpTo(_controller2.offset);
                }
              },
              child: Stack(
                fit: StackFit.passthrough,
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 84,
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          _drawLine(index),
                          Container(
                            height: double.infinity,
                            width: 4.0,
                            color: Colors.blue,
                          ),
                        ],
                      );
                    }
                  ),
                  Container(
                    height: 110,
                    color: Colors.black,
                    child: ListView.builder(
                      itemCount: 7,
                      controller: _controller2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return PianoOctave(
                          seconds: '0',
                          octave: index * 12,
                          keyWidth: widget.keyWidth,
                          labelsOnlyOctaves: false,
                          feedback: true,
                          onTileTap: onTileTap,
                        );
                      }
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

  void _onTap(Note note) {
    setState(() {
      note.state = NoteState.tapped;
    });
  }

  void _scoreDecrement() {
    if(_score > 0) {
      setState(() {
        _score--;
      });
    }
  }

  void _scoreIncrement(Note note) {
    if(note.state == NoteState.ready) {
      setState(() {
        _score++;
      });
    }
  }

  onTileTap(int index){
    List<Note> thisLineNotes =
        widget.notes.sublist(currentNoteIndex, currentNoteIndex + 1).where((note) => note.line == widget.notes[currentNoteIndex].line).toList();

    List<Widget> tiles = thisLineNotes.map((note) {
      int padding = note.orderNumber;
      if(padding < 0) {
        padding = -padding;
        double height = MediaQuery.of(context).size.height;
        double tileHeight = height / 4;
        double offset = (1.5 + animationController.value) * tileHeight;
        if(height == 432.0) {
          if( (offset>180 && offset < 234 + padding)){
            if(widget.notes[currentNoteIndex].line == index - 24) {
              _scoreIncrement(note);
              _onTap(note);
            }
            else {
              _scoreDecrement();
            }
          }
          else {
            _scoreDecrement();
          }
        }
        else {
          if( (offset > 139 && offset < 187 + padding) || (offset > 236 && offset < 244 + padding) ){
            if(widget.notes[currentNoteIndex].line == index - 24) {
              _scoreIncrement(note);
              _onTap(note);
            }
            else {
              _scoreDecrement();
            }
          }
          else {
            _scoreDecrement();
          }
        }
      }
      else {
        double height = MediaQuery.of(context).size.height;
        double tileHeight = height / 4;
        double offset = (1.5 + animationController.value) * tileHeight;
        if(height == 432.0) {
          if( (offset>180 + padding && offset < 234)){
            if(widget.notes[currentNoteIndex].line == index - 24) {
              _scoreIncrement(note);
              _onTap(note);
            }
            else {
              _scoreDecrement();
            }
          }
          else {
            _scoreDecrement();
          }
        }
        else {
          if( (offset > 139 && offset < 187  + padding) || (offset > 236 && offset < 244 + padding) ){
            if(widget.notes[currentNoteIndex].line == index - 24) {
              _scoreIncrement(note);
              _onTap(note);
            }
            else {
              _scoreDecrement();
            }
          } 
          else {
            _scoreDecrement();
          }
        }
      }
    }).toList();
  }
  _drawLine(int lineNumber) {
    this.index = lineNumber;
    return Container(
      width: getTileWidth(),
      child: Line(
        lineNumber: lineNumber,
        currentNotes: widget.notes.sublist(currentNoteIndex, currentNoteIndex + 4),
        animation: animationController,
      ),
    );
  }
}

