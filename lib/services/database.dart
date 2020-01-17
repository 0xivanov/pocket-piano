  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pocket_piano/Models/record.dart';
import 'package:pocket_piano/Models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference recordsCollection = Firestore.instance.collection('records');

  Future<void> updateUserData(String name, List<int> midiSounds, List<double> midiSeconds, double duration ) async {
    return await recordsCollection.document(uid).collection('$name').document().setData({
      'name' : name,
      'midiSounds' : midiSounds,
      'midiSeconds' : midiSeconds,
      'duration' : duration,
    });
  }

  // brew list from snapshot
  List<Record> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Record(
        name: doc.data['name'] ?? '',
        midiSounds: doc.data['midiSounds'] ?? null,
        midiSeconds: doc.data['midiSeconds'] ?? null,
        duration: doc.data['duration'] ?? 0,
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      midiSounds: snapshot.data['midiSounds'],
      midiSeconds: snapshot.data['midiSeconds'],
      duration: snapshot.data['duration'],
    );
  }

  // get brews stream
  Stream<List<Record>> get records {
    return recordsCollection.snapshots()
      .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return recordsCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}