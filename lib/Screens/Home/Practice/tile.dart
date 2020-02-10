import 'package:flutter/material.dart';
import 'package:pocket_piano/Screens/Home/Practice/notes.dart';

class Tile extends StatelessWidget {
  final double height;
  final NoteState noteState;
  const Tile({Key key, this.noteState, this.height}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: height > 0 ? EdgeInsets.only(top: height) : EdgeInsets.only(bottom: -height) ,
      width: double.infinity,
      height: 110,
      child: Image(color: color, image: AssetImage('assets/small_note.png')),
    );
  }
  Color get color {
    switch (noteState) {
      case NoteState.ready: return Colors.black;
      case NoteState.tapped: return Colors.transparent;
      default: return Colors.black;
    }
  }
}