import 'package:flutter/material.dart';
import 'package:pocket_piano/Screens/Home/Practice/notes.dart';
import 'package:pocket_piano/Screens/Home/Practice/tile.dart';


class Line extends AnimatedWidget {
  final int lineNumber;
  final List<Note> currentNotes;

  const Line({Key key, this.currentNotes, this.lineNumber, Animation<double> animation}) 
  : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {

    Animation<double> animation = super.listenable;
    //get heights
    double height = MediaQuery.of(context).size.height;
    double tileHeight = height / 4;
    
    //get only notes for that line
    List<Note> thisLineNotes =
        currentNotes.where((note) => note.line == lineNumber).toList();

    //map notes to widgets
    List<Widget> tiles = thisLineNotes.map((note) {
      //specify note distance from top
      int index = currentNotes.indexOf(note);
      double offset = (0.0 - index + animation.value) * tileHeight;
      return Transform.translate(
        offset: Offset(0, offset),
        child: Tile(
          noteState: note.state,
          height: height
        ),
      );
    }).toList();
    
    return SizedBox.expand(
      child: Stack(
        children: tiles,
      ),
    );
  }
}