import 'dart:async';

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
    _loadSoundFont();
    Future.delayed(Duration(seconds: 60)).then((_) {
    });
    super.initState();
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
            FlatButton(
              onPressed: (){
                setState(() {
                  _seconds = 0;
                  MidiSound.midiSeconds.clear();
                  MidiSound.midiSounds.clear();
                });
              },
              child: Icon(
                Icons.restore,
                color: Colors.blue,
                size: 40,
              )
            ),
            Text("${_seconds.toStringAsFixed(1)}"),
            FlatButton(
              onPressed: (){
                _playing ? stopTimer() : startTimer(); 
                setState(() {_playing = !_playing;});
              },
              child: _playing ? Icon(
                Icons.pause,
                color: Colors.red,
                size: 40,
              ) : Icon(
                Icons.fiber_manual_record,
                color: Colors.red,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    ),
    body: SafeArea(
      child: Container(
        color: Colors.black,
        child: _buildKeys(context),
      ),
    ),
      );
  }

  Widget _buildKeys(BuildContext context) {
    double keyWidth = 40 + (80 * 0.5);
    final _vibrate = true;
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Flexible(
          child: PianoView(
            seconds: _seconds.toStringAsFixed(1),
            keyWidth: keyWidth,
            labelsOnlyOctaves: false,
            feedback: _vibrate,
          ),
        ),
        Flexible(
          child: PianoView(
            seconds: _seconds.toStringAsFixed(1),
            keyWidth: keyWidth,
            labelsOnlyOctaves: false,
            feedback: _vibrate,
          ),
        ),
      ],
    );
  }
}
