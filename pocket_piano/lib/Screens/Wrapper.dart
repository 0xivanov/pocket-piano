import 'package:flutter/material.dart';
import 'package:pocket_piano/Screens/Home/Home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or login screen
    return Home();
  }
}