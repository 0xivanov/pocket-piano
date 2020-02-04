import 'package:flutter/material.dart';

import 'piano_key.dart';

class PianoOctave extends StatelessWidget {
  const PianoOctave({
    this.onTileTap,
    this.seconds,
    this.keyWidth,
    this.octave,
    //@required this.showLabels,
    @required this.labelsOnlyOctaves,
    this.feedback,
  });

  final Function(int) onTileTap;
  final String seconds;
  final double keyWidth;
  final int octave;
  //final bool showLabels;
  final bool labelsOnlyOctaves;
  final bool feedback;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Row( children: <Widget>[
        _buildKey(24, false),
        _buildKey(26, false),
        _buildKey(28, false),
        _buildKey(29, false),
        _buildKey(31, false),
        _buildKey(33, false),
        _buildKey(35, false),
      ]),
      Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 60,
          top: 0.0,
          child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(width: keyWidth * .5),
                _buildKey(25, true),
                _buildKey(27, true),
                Container(width: keyWidth),
                _buildKey(30, true),
                _buildKey(32, true),
                _buildKey(34, true),
                Container(width: keyWidth * .5),
              ])),
    ]);
  }

  Widget _buildKey(int midi, bool accidental) {
    return PianoKey(
      onTileTap: onTileTap,
      seconds: seconds,
      midi: midi + octave,
      accidental: accidental,
      keyWidth: keyWidth,
      labelsOnlyOctaves: labelsOnlyOctaves,
      feedback: feedback,
    );
  }
}
