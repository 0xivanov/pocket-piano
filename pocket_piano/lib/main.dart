import 'package:flutter/material.dart';
import 'package:pocket_piano/Models/User.dart';
import 'package:pocket_piano/Screens/Wrapper.dart';
import 'package:pocket_piano/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper()
      ),
    );
  }
}
