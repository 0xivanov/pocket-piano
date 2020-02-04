import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/Piano/piano_view.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/midi_sound.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/save_form.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _loadSoundFont(); 
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  void _loadSoundFont() async {
    FlutterMidi.unmute();
    rootBundle.load("assets/sf2/Piano.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "Piano.sf2");
    });
  }
  double _seconds = 0;
  bool _playing = false;
  Timer _timer;
  bool canVibrate = false;


  void startTimer() {
    MidiSound.midiSeconds.clear();
    MidiSound.midiSounds.clear();
    const oneMimiSec = const Duration(milliseconds: 100);
    _timer = new Timer.periodic(
      oneMimiSec,
      (Timer timer) => setState(
        () {
            _seconds = _seconds + 0.1;
        },
      ),
    );
  }
  void stopTimer(){
    showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SaveForm(midiSounds: MidiSound.midiSounds, midiSeconds: MidiSound.midiSeconds, duration: _seconds,),
        );
      });
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        backgroundColor: Color(0xff8B16FF),
        title: Center(
          child: Text(
            "The pocket piano",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
            ),
          ),
        ),
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
          Row(
            children: <Widget>[
              FlatButton.icon(
                label: Text("Reset"),
                onPressed: (){
                  setState(() {
                    _seconds = 0;
                    _timer.cancel();
                    MidiSound.midiSeconds.clear();
                    MidiSound.midiSounds.clear();
                  });
                },
                icon: Icon(
                  Icons.restore,
                  color: Colors.blue,
                  size: 30,
                )
              ),
              Text("${_seconds.toStringAsFixed(1)}"),
              FlatButton.icon(
                label: _playing ? Text("Pause") : Text("Start"),
                onPressed: (){
                  _playing ? stopTimer() : startTimer(); 
                  setState(() {_playing = !_playing;});
                },
                icon: _playing ? Icon(
                  Icons.pause,
                  color: Colors.red,
                  size: 30,
                ) : Icon(
                  Icons.fiber_manual_record,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Flexible(
                child: PianoView(
                  seconds: _seconds.toStringAsFixed(1),
                  keyWidth: 80,
                  labelsOnlyOctaves: false,
                  feedback: true,
                ),
              ),
              Flexible(
                child: PianoView(
                  seconds: _seconds.toStringAsFixed(1),
                  keyWidth: 80,
                  labelsOnlyOctaves: false,
                  feedback: true,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
