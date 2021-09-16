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
