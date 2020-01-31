import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/Piano/piano_octave.dart';
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

  @override
  void initState() {
    _loadSoundFont();
    Future.delayed(Duration(seconds: 60)).then((_) {
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1)); //<--- Init the AnimationController
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) { //<--- Whenever animation finishes
        if (currentNoteIndex == notes.length - 5) {
          //song finished
        } else {                                //<--- If the song didn't end
          setState(() => ++currentNoteIndex);   //<--- Increase currentNoteIndex
          animationController.forward(from: 0); //<--- And start over the animation
        }
      }
    });
    animationController.forward();
    super.initState();
  }

  void _loadSoundFont() async {
    FlutterMidi.unmute();
    rootBundle.load("assets/sf2/Piano.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "Piano.sf2");
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            _controller.jumpTo(_controller2.offset);
            //print('check -- offset Left: '+_controller.offset.toInt().toString()+ ' -- offset Right: '+_controller2.offset.toInt().toString());
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 49,
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
                height: 150,
                color: Colors.black,
                child: ListView.builder(
                  itemCount: 7,
                  controller: _controller2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return PianoOctave(
                      seconds: '',
                      octave: index * 12,
                      keyWidth: 80,
                      labelsOnlyOctaves: false,
                      feedback: true,
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
  _drawLine(int lineNumber) {
    return Container(
      width: 80,
      child: Line(
        lineNumber: lineNumber,
        currentNotes: notes.sublist(currentNoteIndex, currentNoteIndex + 4),
        animation: animationController,
      ),
    );
  }
}

