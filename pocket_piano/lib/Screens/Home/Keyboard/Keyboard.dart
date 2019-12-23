import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:tonic/tonic.dart';

class Keyboard extends StatefulWidget {
 @override
 _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  initState() {
    FlutterMidi.unmute();
    rootBundle.load("assets/sf2/Piano.SF2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "Piano.SF2");
    });
    super.initState();
  }

  double get keyWidth => 80 + (80 * _widthRatio);
  double _widthRatio = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ListView.builder(
          itemCount: 7,
          controller: ScrollController(initialScrollOffset: 1500.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final int i = index * 12;
            return SafeArea(
              child: Stack(children: <Widget>[
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  _buildKey(24 + i, false),
                  _buildKey(26 + i, false),
                  _buildKey(28 + i, false),
                  _buildKey(29 + i, false),
                  _buildKey(31 + i, false),
                  _buildKey(33 + i, false),
                  _buildKey(35 + i, false),
                  ]
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 100,
                  top: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(width: keyWidth * .5),
                      _buildKey(25 + i, true),
                      _buildKey(27 + i, true),
                      Container(width: keyWidth),
                      _buildKey(30 + i, true),
                      _buildKey(32 + i, true),
                      _buildKey(34 + i, true),
                      Container(width: keyWidth * .5),
                    ]
                  ),
                ),
              ])
            );
          },
        ),
      ),
    );
  }

  Widget _buildKey(int midi, bool accidental) {
    final pitchName = Pitch.fromMidiNumber(midi).toString();
    final pianoKey = Stack(
      children: <Widget>[
        Semantics(
            button: true,
            hint: pitchName,
            child: Material(
                borderRadius: borderRadius,
                color: accidental ? Colors.black : Colors.white,
                child: InkWell(
                  borderRadius: borderRadius,
                  highlightColor: Colors.grey,
                  onTap: () {},
                  onTapDown: (_) => FlutterMidi.playMidiNote(midi: midi),
                ))),
        Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 20.0,
            child: Text(
              pitchName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: !accidental ? Colors.black : Colors.white
              ),
            )
          ),
      ],
    );
    if (accidental) {
      return Container(
        width: keyWidth,
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        padding: EdgeInsets.symmetric(horizontal: keyWidth * .1),
        child: Material(
          elevation: 6.0,
          borderRadius: borderRadius,
          shadowColor: Color(0x802196F3),
          child: pianoKey));
    }
    return Container(
        width: keyWidth,
        child: pianoKey,
        margin: EdgeInsets.symmetric(horizontal: 2.0));
  }
}

  const BorderRadiusGeometry borderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0));