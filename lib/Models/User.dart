class User {

  final String uid;
  final String email;

  User ({this.uid, this.email});
}

class UserData {

  final String uid;
  final String name;
  final List<int> midiSounds;
  final List<double> midiSeconds;
  final double duration;

  UserData({ this.uid, this.name, this.midiSounds, this.midiSeconds, this.duration });

}