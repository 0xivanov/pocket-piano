import 'package:flutter/material.dart';
import 'package:pocket_piano/Models/record.dart';
import 'package:pocket_piano/Screens/Home/Records/records_list.dart';
import 'package:provider/provider.dart';
import 'package:pocket_piano/Services/database.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Record>>.value(
      value: DatabaseService().records,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Records"),
          backgroundColor: Color(0xff8B16FF),
        ),
        body: RecordsList(),
      ),
    );
  }
}