import 'package:flutter/material.dart';

import 'piano_octave.dart';
import 'piano_slider.dart';

class PianoView extends StatefulWidget {
  const PianoView({
    this.keyWidth,
    @required this.labelsOnlyOctaves,
    this.feedback,
  });

  final double keyWidth;
  final bool labelsOnlyOctaves;
  final bool feedback;

  @override
  _PianoViewState createState() => _PianoViewState();
}

class _PianoViewState extends State<PianoView> {
  int _currentOctave = 3;
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: currentOffset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 39.0,
          child: Container(
            child: PianoSlider(
              keyWidth: widget.keyWidth,
              currentOctave: _currentOctave,
              octaveTapped: (int octave) {
                setState(() {
                  _currentOctave = octave;
                });
                _controller.jumpTo(currentOffset);
              },
            ),
          ),
        ),
        Container(
          height: 130.0,
          child: ListView.builder(
              itemCount: 7,
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return PianoOctave(
                  octave: index * 12,
                  keyWidth: widget.keyWidth,
                  // showLabels: widget.showLabels,
                  labelsOnlyOctaves: widget.labelsOnlyOctaves,
                  feedback: widget.feedback,
                );
              },
            ),
        ),
      ],
    );
  }

  double get currentOffset => widget.keyWidth * (7 * _currentOctave);
}
