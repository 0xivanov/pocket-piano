import 'package:flutter/material.dart';
import 'package:pocket_piano/services/database.dart';
import 'package:provider/provider.dart';
import 'package:pocket_piano/Models/user.dart';

class SaveForm extends StatefulWidget {
  final List<int> midiSounds;
  final List<String> midiSeconds;
  final double duration;
  SaveForm({this.midiSounds, this.midiSeconds, this.duration});
  @override
  _SaveFormState createState() => _SaveFormState();
}

class _SaveFormState extends State<SaveForm> {

  final _formKey = GlobalKey<FormState>();
  String _name;
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            "Save your melody",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            validator: (val) => val.isEmpty ? "Enter a value" : null,
            onChanged: (val) => setState(() => _name = val),
            decoration: InputDecoration(
              hintText: "Name",
              hintStyle: TextStyle(
                fontSize: 19.0,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff8B16FF),
                  width: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          FlatButton.icon(
            icon: Icon(Icons.save_alt),
            label: Text("Save"),
            color: Color(0xff8B16FF),
            onPressed: () async {
              if(_formKey.currentState.validate()) {
                await DatabaseService(uid:user.uid, name: _name).
                updateUserData(_name, widget.midiSounds, widget.midiSeconds, widget.duration);
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}