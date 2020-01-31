import 'package:flutter/material.dart';


class LineDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: 1,
          color: Colors.blue,
        ),
      ],
    );
  }
}