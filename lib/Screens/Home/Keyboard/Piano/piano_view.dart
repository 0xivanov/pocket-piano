import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'piano_octave.dart';
import 'piano_slider.dart';

class PianoView extends StatefulWidget {
  const PianoView({
    this.seconds,
    this.keyWidth,
    @required this.labelsOnlyOctaves,
    this.feedback,
  });
  final String seconds;
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _controller = ScrollController(initialScrollOffset: currentOffset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          flex: 3,
          child: Container(
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
        ),
        Flexible(
          flex: 8,
          child: Container(
            height: 130.0,
            child: ListView.builder(
                itemCount: 7,
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return PianoOctave(
                    onTileTap: (int) {},
                    seconds: widget.seconds,
                    octave: index * 12,
                    keyWidth: widget.keyWidth,
                    labelsOnlyOctaves: widget.labelsOnlyOctaves,
                    feedback: widget.feedback,
                  );
                },
              ),
          ),
        ),
      ],
    );
  }

  double get currentOffset => widget.keyWidth * (7 * _currentOctave);
}
