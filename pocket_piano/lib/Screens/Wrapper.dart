import 'package:flutter/material.dart';
import 'package:pocket_piano/Models/User.dart';
import 'package:pocket_piano/Screens/Authenticate/Login.dart';
import 'package:pocket_piano/Screens/Home/Home.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //return either home or login screen
    if (user == null) {
      return Login();
    } else {
      return Home();
    }
  }
}