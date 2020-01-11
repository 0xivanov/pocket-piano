import 'package:flutter/material.dart';
import 'package:pocket_piano/Screens/Home/Keyboard/MidiSound.dart';
import 'package:tonic/tonic.dart';

import 'package:flutter_midi/flutter_midi.dart';
import '../../plugins/vibrate/vibrate.dart';

class PianoKey extends StatelessWidget {
  PianoKey({
    this.seconds,
    @required this.keyWidth,
    this.midi,
    this.accidental,
    //@required this.showLabels,
    @required this.labelsOnlyOctaves,
    this.feedback,
  });

  final Duration seconds;
  final bool accidental;
  final double keyWidth;
  final int midi;
  //final bool showLabels;
  final bool labelsOnlyOctaves;
  final bool feedback;
  MidiSound instance = MidiSound();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: _borderRadius,
      highlightColor: Colors.grey,
      onTap: () {},
      onTapDown: (_) {
        instance.recordSound(midi, seconds);
        FlutterMidi.playMidiNote(midi: midi);
        if (feedback) {
          VibrateUtils.light();
        }
        print(MidiSound.midiSounds);
        print(MidiSound.midiSeconds);
      },
      onTapCancel: () {
        FlutterMidi.stopMidiNote(midi: midi);
      },
      child: Builder(
        builder: (_) {
          final pitchName = Pitch.fromMidiNumber(midi).toString();
          final pianoKey = Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                top: 0.0,
                child: Semantics(
                  child: Material(
                    borderRadius: _borderRadius,
                    color: accidental ? Colors.black : Colors.white,
                  ),
                )
              ),
              Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 20.0,
                  child: buildShowLabels(pitchName)
                      ? Text(pitchName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:
                                  !accidental ? Colors.black : Colors.white))
                      : Container()),
            ],
          );
          return Container(
              width: keyWidth,
              child: pianoKey,
              margin: EdgeInsets.symmetric(horizontal: 2.0));
        },
      ),
    );
  }

  bool buildShowLabels(String pitchName) {
    if (true) {
      if (labelsOnlyOctaves) {
        if (pitchName.replaceAll(RegExp("[0-9]"), "") == "C") return true;
        return false;
      }
      return true;
    }
  }
}

const BorderRadiusGeometry _borderRadius = BorderRadius.only(
  bottomLeft: Radius.circular(10.0),
  bottomRight: Radius.circular(10.0),
);
