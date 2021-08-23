class MyDateTime {
  DateTime _date;

  MyDateTime() : _date = DateTime.now();

  add(int num, String type) {
    switch (type) {
      case 'days':
        _addDays(num);
        break;
      default:
    }
  }

  setDate(DateTime date) {
    this._date = date;
    return this._date; // 使用(.)與(..)取得的內容會不一樣
  }

  _addDays(int num) {
    _date = _date.add(Duration(days: num));
  }

  toString() {
    return _date.toString();
  }
}

void main() {
  var date = MyDateTime();

  var result = date
    ..setDate(DateTime(2021, 8, 2))
    ..add(30, 'days')
    ..toString();

  print(result); // 2021-09-01 00:00:00.000

  var dateTime = MyDateTime().setDate(DateTime(2021, 8, 2));
  print(dateTime.runtimeType); // DateTime
  var myDateTime = MyDateTime()..setDate(DateTime(2021, 8, 2));
  print(myDateTime.runtimeType); // MyDateTime
}
