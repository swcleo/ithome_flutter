import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

// https://opendata.cwb.gov.tw/opendatadoc/MFC/D0047.pdf
// 天氣現狀況
// 1~42

var icons = {
  0: Icons.autorenew,
  15: WeatherIcons.storm_showers,
  22: WeatherIcons.storm_showers
};

Icon weatherIcons(int type) {
  var icon;

  // 晴
  if (icons[type] != null) {
    icon = icons[type]!;
  } else {
    print("未定義天氣icon 代碼 $type");
    icon = Icons.autorenew;
  }

  return Icon(icon, size: 80.0);
}
