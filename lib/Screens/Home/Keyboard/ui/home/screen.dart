import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_midi/flutter_midi.dart';

import '../../data/blocs/blocs.dart';
import '../../data/blocs/settings/settings.dart';
import '../../plugins/vibrate/vibrate.dart';
import '../common/index.dart';
import '../common/piano_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  initState() {
    _loadSoundFont();
    Future.delayed(Duration(seconds: 60)).then((_) {
      //if (mounted) ReviewUtils.requestReview();
    });
    super.initState();
  }

  void _loadSoundFont() async {
    FlutterMidi.unmute();
    rootBundle.load("assets/sf2/Piano.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "Piano.sf2");
    });
    VibrateUtils.canVibrate.then((vibrate) {
      // if (mounted)
        setState(() {
          canVibrate = vibrate;
        });
    });
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   print("State: $state");
  //   _loadSoundFont();
  // }

  bool canVibrate = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) => Scaffold(  
        appBar: AppBar(
          backgroundColor: Color(0xff8B16FF),
          title: Center(
            child: Text(
              "The pocket piano",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
              ),
            ),
          ),
          leading: FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Icon(
                Icons.fiber_manual_record,
                color: Colors.red,
                size: 40,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: _buildKeys(context, state.settings),
          ),
        ),
      ),
    );
  }

  Widget _buildKeys(BuildContext context, Settings settings) {
    double keyWidth = 40 + (80 * 0.5);
    final _vibrate = settings.shouldVibrate && canVibrate;
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Flexible(
          child: PianoView(
            keyWidth: keyWidth,
            //showLabels: settings.showLabels,
            labelsOnlyOctaves: settings.labelsOnlyOctaves,
            //disableScroll: settings.disableScroll,
            feedback: _vibrate,
          ),
        ),
        Flexible(
          child: PianoView(
            keyWidth: keyWidth,
            //showLabels: settings.showLabels,
            labelsOnlyOctaves: settings.labelsOnlyOctaves,
            //disableScroll: settings.disableScroll,
            feedback: _vibrate,
          ),
        ),
      ],
    );
  }
}
