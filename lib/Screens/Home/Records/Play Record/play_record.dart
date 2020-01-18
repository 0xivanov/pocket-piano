import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:pocket_piano/Models/record.dart';
import 'package:provider/provider.dart';

class PlayRecord extends StatefulWidget {
  final Record record;
  PlayRecord({this.record});
  @override
  _PlayRecordState createState() => _PlayRecordState();
}

class _PlayRecordState extends State<PlayRecord> {

  double _seconds = 0;
  Timer _timer;
  int _index = 0;
  @override
  Widget build(BuildContext context) {

  void startTimer() {
    const oneMimiSec = const Duration(milliseconds: 100);
    _timer = new Timer.periodic(
      oneMimiSec,
      (Timer timer) => setState(
        () {
          if(_seconds.toStringAsFixed(1) == widget.record.duration.toStringAsFixed(1)) return;
          if(_seconds.toStringAsFixed(1) == widget.record.midiSeconds[_index]){
            if(widget.record.midiSeconds.length >= _index){
              _index++;
            }else
            return;
            FlutterMidi.playMidiNote(midi : widget.record.midiSounds[_index]);
          }
          _seconds = _seconds + 0.1;
        },
      ),
    );
  }

    return Scaffold(
      body: Container(
        child: FlatButton(
          onPressed: (){
            startTimer();
          },
          child: Text("${widget.record.midiSeconds[_index]}"),
        ),
      ),
    );
  }
}