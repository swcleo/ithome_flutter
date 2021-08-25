import 'dart:async';
import 'package:flutter/foundation.dart';

class TimeModel with ChangeNotifier {
  int _timestamp = DateTime.now().millisecondsSinceEpoch;
  int get timestamp => _timestamp;

  TimeModel() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        _timestamp += 1000;
        notifyListeners();
      },
    );
  }

  String toString() {
    var now = DateTime.fromMillisecondsSinceEpoch(_timestamp);
    var year = now.year.toString();
    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    var hour = now.hour.toString().padLeft(2, '0');
    var minute = now.minute.toString().padLeft(2, '0');
    var second = now.second.toString().padLeft(2, '0');
    return "$year-$month-$day $hour:$minute:$second";
  }
}
