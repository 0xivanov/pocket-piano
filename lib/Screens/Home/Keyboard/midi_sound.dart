class MidiSound {

  static var midiSounds =  List<int>();
  static var midiSeconds =  List<String>();
  void recordSound(int midi, String seconds){
    midiSounds.add(midi);
    midiSeconds.add(seconds);
  }
}