import 'dart:math' as math;

void main() {
  var aListOfNum = [1, 2, 3, 4];
  var aListOfNumByPow = aListOfNum.map((num) => math.pow(num, 2)).toList();
  print(aListOfNumByPow); // [1, 4, 9, 16]
}
