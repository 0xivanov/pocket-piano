import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pocket_piano/Models/record.dart';
import 'package:pocket_piano/Models/user.dart';
import 'package:pocket_piano/Screens/Home/Records/Play%20Record/play_record.dart';
import 'package:pocket_piano/Services/database.dart';
import 'package:provider/provider.dart';

class RecordTile extends StatelessWidget {
  final Record record;
  RecordTile({ this.record });
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text("${record.name}"),
          onTap: (){
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation){
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: PlayRecord(record: record)
                );
              }
            );
          },
          trailing: FlatButton.icon(
            label: Text("delete"),
            icon: Icon(Icons.delete),
            onPressed: (){
              DatabaseService(name: record.name, uid: user.uid).deleteRecord();
            },
          ),
        )
      ),
    );
  }
}