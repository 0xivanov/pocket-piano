import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/Piano/piano_octave.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/midi_sound.dart';
import 'package:pocket_piano/Screens/Home/Practice/Songs/WeWishUMerryXmas/song_provider.dart';
import 'package:pocket_piano/Screens/Home/Practice/line.dart';
import 'package:pocket_piano/Screens/Home/Practice/notes.dart';


class WeWishYouMerryXmas extends StatefulWidget {
  @override
  _WeWishYouMerryXmasState createState() => _WeWishYouMerryXmasState();
}

class _WeWishYouMerryXmasState extends State<WeWishYouMerryXmas> with SingleTickerProviderStateMixin {

  ScrollController  _controller = ScrollController();
  ScrollController  _controller2 = ScrollController();
  List<Note> notes = initNotes();
  int currentNoteIndex = 0;
  AnimationController animationController;
  int index;
  NoteState noteState;
  int _score = 0;
  bool isFast = true;

  @override
  void initState() {
        super.initState();
            SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (currentNoteIndex == notes.length - 4) {
          //song finished
        } else {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Score : $_score points out of ${notes.length - 4}"),
        backgroundColor: Color(0xff8B16FF),
        leading: FlatButton(
        onPressed: (){
          MidiSound.midiSeconds.clear();
          MidiSound.midiSounds.clear();
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        FlatButton.icon(
          label: isFast ? Text("Slow") : Text("Fast"),
          icon: Icon(Icons.slow_motion_video),
          onPressed: (){
            if(isFast) {
              setState(() {
                isFast = !isFast;
                animationController.duration = Duration(milliseconds: 600);
              });
            }
            else {
              setState(() {
                isFast = !isFast;
                animationController.duration = Duration(milliseconds: 1200);
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
            _controller.jumpTo(_controller2.offset);
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
                height: 120,
                color: Colors.black,
                child: ListView.builder(
                  itemCount: 7,
                  controller: _controller2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return PianoOctave(
                      seconds: '0',
                      octave: index * 12,
                      keyWidth: 80,
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

  void _onTap(Note note) {
    setState(() {
      note.state = NoteState.tapped;
    });
  }

  void _scoreIncrement() {
    setState(() {
      _score++;
    });
  }

  onTileTap(int index){

    List<Note> thisLineNotes =
        notes.sublist(currentNoteIndex, currentNoteIndex + 1).where((note) => note.line == notes[currentNoteIndex].line).toList();

    //map notes to widgets
    List<Widget> tiles = thisLineNotes.map((note) {
      print(index - 24);
      print(notes[currentNoteIndex].line);
      double height = MediaQuery.of(context).size.height;
      double tileHeight = height / 4;
      double offset = (1.5 + animationController.value) * tileHeight;
      if(offset>172 && offset < 235) {
        if(notes[currentNoteIndex].line == index - 24) {
          _onTap(note);
          _scoreIncrement();
        } else {

        }
      }
      else {
      }
    }).toList();
  }
  _drawLine(int lineNumber) {
    this.index = lineNumber;
    return Container(
      width: 45 ,
      child: Line(
        lineNumber: lineNumber,
        currentNotes: notes.sublist(currentNoteIndex, currentNoteIndex + 4),
        animation: animationController,
      ),
    );
  }
}

