import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final double height;

  const Tile({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Container(color: Colors.black),
    );
  }
}