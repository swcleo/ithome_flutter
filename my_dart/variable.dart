void main() {
  //String
  var aString = "I am a String";
  print(aString.runtimeType); // String

  // Numbers
  var aInterger = 1;
  print(aInterger.runtimeType); // int

  var aDobule = 0.1;
  print(aDobule.runtimeType); // dobule

  // Booleans
  var aTrue = true;
  print(aTrue.runtimeType); // bool

  // Lists or Array
  var aList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(aList.runtimeType); //  List<int>

  // Maps
  var aMap = {"type": "Mobile Development", "title": "flutter"};
  print(aMap.runtimeType); // _InternalLinkedHashMap<String, String>

  // Sets
  var aSet = {"a", "b", "c", "d", "e"};
  print(aSet.runtimeType); // _CompactLinkedHashSet<String>

  // Null
  var aNull = null;
  print(aNull.runtimeType); // Null

  // Runes
  var emoji = "😀";
  print(emoji.runes.runtimeType); // Runes

  // Symbols
  var aSymbol = Symbol("ithome");
  print(aSymbol); // Symbol("ithome")
}
