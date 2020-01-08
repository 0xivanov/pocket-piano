import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/home/screen.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({
    Key key,
  }) : super(key: key);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  //final _settingsBloc = SettingsBloc();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    //_settingsBloc.dispatch(CheckSettings());
    super.initState();
  }

  @override
  void dispose() {
    //_settingsBloc.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
