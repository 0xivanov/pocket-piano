class MidiSound {

  static int index;
  static List<int> list = List(100);
  void recordSound(int midi){
    if(index == null) index = 0;
    list[index] = midi;
    index ++;
  }
}