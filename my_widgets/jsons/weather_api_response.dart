// To parse this JSON data, do
//
//     final weatherApiResponse = weatherApiResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WeatherApiResponse weatherApiResponseFromJson(String str) =>
    WeatherApiResponse.fromJson(json.decode(str));

String weatherApiResponseToJson(WeatherApiResponse data) =>
    json.encode(data.toJson());

class WeatherApiResponse {
  WeatherApiResponse({
    required this.success,
    required this.records,
  });

  final String success;
  final Records records;

  factory WeatherApiResponse.fromJson(Map<String, dynamic> json) =>
      WeatherApiResponse(
        success: json["success"],
        records: Records.fromJson(json["records"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "records": records.toJson(),
      };
}

class Records {
  Records({
    required this.locations,
  });

  final List<RecordsLocation> locations;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
        locations: List<RecordsLocation>.from(
            json["locations"].map((x) => RecordsLocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
      };
}

class RecordsLocation {
  RecordsLocation({
    required this.datasetDescription,
    required this.locationsName,
    required this.dataid,
    required this.location,
  });

  final String datasetDescription;
  final String locationsName;
  final String dataid;
  final List<LocationLocation> location;

  factory RecordsLocation.fromJson(Map<String, dynamic> json) =>
      RecordsLocation(
        datasetDescription: json["datasetDescription"],
        locationsName: json["locationsName"],
        dataid: json["dataid"],
        location: List<LocationLocation>.from(
            json["location"].map((x) => LocationLocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "datasetDescription": datasetDescription,
        "locationsName": locationsName,
        "dataid": dataid,
        "location": List<dynamic>.from(location.map((x) => x.toJson())),
      };
}

class LocationLocation {
  LocationLocation({
    required this.locationName,
    required this.geocode,
    required this.lat,
    required this.lon,
    required this.weatherElement,
  });

  final String locationName;
  final String geocode;
  final String lat;
  final String lon;
  final List<WeatherElement> weatherElement;

  factory LocationLocation.fromJson(Map<String, dynamic> json) =>
      LocationLocation(
        locationName: json["locationName"],
        geocode: json["geocode"],
        lat: json["lat"],
        lon: json["lon"],
        weatherElement: List<WeatherElement>.from(
            json["weatherElement"].map((x) => WeatherElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "locationName": locationName,
        "geocode": geocode,
        "lat": lat,
        "lon": lon,
        "weatherElement":
            List<dynamic>.from(weatherElement.map((x) => x.toJson())),
      };
}

class WeatherElement {
  WeatherElement({
    required this.elementName,
    required this.description,
    required this.time,
  });

  final String elementName;
  final String description;
  final List<Time> time;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        elementName: json["elementName"],
        description: json["description"],
        time: List<Time>.from(json["time"].map((x) => Time.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "elementName": elementName,
        "description": description,
        "time": List<dynamic>.from(time.map((x) => x.toJson())),
      };
}

class Time {
  Time({
    required this.startTime,
    required this.endTime,
    required this.elementValue,
  });

  final DateTime startTime;
  final DateTime endTime;
  final List<ElementValue> elementValue;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        elementValue: List<ElementValue>.from(
            json["elementValue"].map((x) => ElementValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "elementValue": List<dynamic>.from(elementValue.map((x) => x.toJson())),
      };
}

class ElementValue {
  ElementValue({
    required this.value,
    required this.measures,
  });

  final String value;
  final String measures;

  factory ElementValue.fromJson(Map<String, dynamic> json) => ElementValue(
        value: json["value"],
        measures: json["measures"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "measures": measures,
      };
}
