class MidiSound {

  static var midiSounds =  List<int>();
  static var midiSeconds =  List<double>();
  void recordSound(int midi, double seconds){
    midiSounds.add(midi);
    midiSeconds.add(seconds);
  }
}