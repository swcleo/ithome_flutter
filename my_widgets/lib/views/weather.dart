import 'package:flutter/material.dart';
import '../api/wether.dart';
import '../models/districts.dart';
import '../models/weather.dart';
import 'helpers/weather_icons.dart';

class WeatherForecastWidget extends StatefulWidget {
  final City city;
  WeatherForecastWidget({required this.city});

  @override
  _WeatherForecastWidgetState createState() =>
      _WeatherForecastWidgetState(this.city);
}

class _WeatherForecastWidgetState extends State<WeatherForecastWidget> {
  City city;
  String description = "";
  int wx = 0;

  late List<String> _districts;
  late String _selected;

  _WeatherForecastWidgetState(this.city) {
    _districts = getDistricts(this.city);
    _selected = _districts[0];
    this.fetch();
  }

  void fetch() async {
    String service;

    switch (city) {
      case City.Taipei:
        service = "/F-D0047-061";
        break;
      case City.Taichung:
        service = "/F-D0047-075";
        break;
      default:
        throw UnimplementedError();
    }

    var params = {"locationName": this._selected};

    var data = await WetherAPI().fetch(service, parameters: params);

    // json_serializable
    var weather = WeatherModel.fromJson(data);

    var record = weather.records.first;

    var description = record.element("WeatherDescription").now.values[0].value;

    var wx = record.element("Wx").now.values[1].value;

    setState(() {
      this.description = description;
      this.wx = int.parse(wx);
    });
  }

  String get cityName {
    switch (city) {
      case City.Taipei:
        return "台北市";
      case City.Taichung:
        return "台中市";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                cityName,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            DropdownButton(
              value: _selected,
              icon: Icon(Icons.keyboard_arrow_down),
              onChanged: (String? value) {
                setState(() {
                  _selected = value!;
                  description = "";
                  this.fetch();
                });
              },
              items: _districts.map(
                (String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                },
              ).toList(),
            ),
          ],
        ),
        SizedBox(
          height: 120,
          child: weatherIcons(wx),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 160, minHeight: 120),
          child: Text(description),
        ),
      ],
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather")),
      body: Column(
        children: [
          WeatherForecastWidget(city: City.Taipei),
          WeatherForecastWidget(city: City.Taichung),
        ],
      ),
    );
  }
}
