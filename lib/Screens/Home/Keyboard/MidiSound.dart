class MidiSound {

  static int _index;
  static List<int> midiSounds = List(500);
  static List<Duration> midiSeconds = List(500);
  void recordSound(int midi, Duration seconds){
    if(_index == null) _index = 0;
    midiSounds[_index] = midi;
    midiSeconds[_index] = seconds;
    _index ++;
  }
}