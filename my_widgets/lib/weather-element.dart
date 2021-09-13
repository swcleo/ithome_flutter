import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

const WeatherIconsMap = {
  '多雲短暫陣雨或雷雨': WeatherIcons.day_sleet_storm,
  '多雲短暫雨': WeatherIcons.day_sleet,
  '多雲': WeatherIcons.cloud,
  '陰': WeatherIcons.cloudy,
  '晴': WeatherIcons.day_sunny,
};

Icon weatherIcons(String type) {
  var icon;
  // print(type);

  if (WeatherIconsMap[type] != null) {
    icon = WeatherIconsMap[type];
  } else {
    icon = Icons.autorenew;
  }

  return Icon(icon, size: 80.0);
}

class WeatherTime {
  String type;
  String startTime;
  String endTime;
  late dynamic value;
  WeatherTime(this.type, dynamic data)
      : this.startTime = data["startTime"],
        this.endTime = data["endTime"] {
    this.value = data["elementValue"][0]["value"];
  }
}

class WeatherModel {
  late Map<String, dynamic> _data;

  WeatherModel() : this._data = {};

  WeatherModel.fromJson(Map<String, dynamic> data) {
    try {
      _data = data["records"]["locations"][0]["location"][0];
    } catch (e) {
      print(e);
    }
  }

  List get _elements => _data["weatherElement"] ?? [];

  /// 天氣敘述
  String get description => attribute("WeatherDescription").first.value;

  /// 天氣概況
  String get wx => attribute("Wx").first.value;

  /// 取資料參數
  List<WeatherTime> attribute(String type) {
    var result = _elements.firstWhere(
      (element) => element["elementName"] == type,
      orElse: () => {},
    );
    return List.from(result["time"])
        .map((el) => WeatherTime(type, el))
        .toList();
  }
}
