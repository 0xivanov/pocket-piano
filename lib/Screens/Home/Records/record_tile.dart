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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayRecord(record: record)),
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