import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pocket_piano/Models/record.dart';


class DatabaseService {

  final String uid;
  final String name;
  DatabaseService({ this.uid, this.name });

  // collection reference

  Future<void> updateUserData(String name, List<int> midiSounds, List<String> midiSeconds, double duration ) async {
    final CollectionReference recordsCollection = Firestore.instance.collection('$uid');
    return await recordsCollection.document('${this.name}').setData({
      'name' : name,
      'midiSounds' : midiSounds,
      'midiSeconds' : midiSeconds,
      'duration' : duration,
    });
  }

  Future<void> updateScoreData(int score) async {
    final CollectionReference recordsCollection = Firestore.instance.collection('$uid' + '1');
    return await recordsCollection.document('${this.name}').setData({
      'score': score
    });
  }

  List<Record> _recordListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
        return Record(
          name: doc.data['name'] ?? '',
          midiSounds: doc.data['midiSounds'] ?? null,
          midiSeconds: doc.data['midiSeconds'] ?? null,
          duration: doc.data['duration'] ?? 0
        );
    }).toList();
  }

  Stream<List<Record>> get getRecordsSnapshot{
    return Firestore.instance.collection('$uid').snapshots().map(_recordListFromSnapshot);
  }

  void deleteRecord(){
    Firestore.instance.collection('$uid').document('${this.name}').delete();
  }

}