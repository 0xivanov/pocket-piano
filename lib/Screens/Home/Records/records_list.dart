import 'package:flutter/material.dart';
import 'package:pocket_piano/Models/record.dart';
import 'package:pocket_piano/Screens/Home/Records/record_tile.dart';
import 'package:provider/provider.dart';

class RecordsList extends StatefulWidget {
  @override
  _RecordsListState createState() => _RecordsListState();
}

class _RecordsListState extends State<RecordsList> {
  @override
  Widget build(BuildContext context) {

    final records = Provider.of<List<Record>>(context);
    
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) {
        return RecordTile(record: records[index]);
      },
    );
  }
}