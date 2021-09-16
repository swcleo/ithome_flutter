// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      json['success'] as String,
      Records.fromJson(json['records'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'success': instance.success,
      'records': instance.records,
    };

Records _$RecordsFromJson(Map<String, dynamic> json) => Records(
      (json['locations'] as List<dynamic>)
          .map((e) => Locations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecordsToJson(Records instance) => <String, dynamic>{
      'locations': instance.locations,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      json['datasetDescription'] as String,
      json['locationsName'] as String,
      json['dataid'] as String,
      (json['location'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'datasetDescription': instance.datasetDescription,
      'locationsName': instance.locationsName,
      'dataid': instance.dataid,
      'location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      json['locationName'] as String,
      json['geocode'] as String,
      json['lat'] as String,
      json['lon'] as String,
      (json['weatherElement'] as List<dynamic>)
          .map((e) => WeatherElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'locationName': instance.locationName,
      'geocode': instance.geocode,
      'lat': instance.lat,
      'lon': instance.lon,
      'weatherElement': instance.weatherElement,
    };

WeatherElement _$WeatherElementFromJson(Map<String, dynamic> json) =>
    WeatherElement(
      json['elementName'] as String,
      json['description'] as String,
      (json['time'] as List<dynamic>?)
          ?.map((e) => Time.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherElementToJson(WeatherElement instance) =>
    <String, dynamic>{
      'elementName': instance.elementName,
      'description': instance.description,
      'time': instance.time,
    };

Time _$TimeFromJson(Map<String, dynamic> json) => Time(
      json['startTime'] as String?,
      json['endTime'] as String?,
      (json['elementValue'] as List<dynamic>?)
          ?.map((e) => ElementValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'elementValue': instance.elementValue,
    };

ElementValue _$ElementValueFromJson(Map<String, dynamic> json) => ElementValue(
      json['value'] as String,
      json['measures'] as String,
    );

Map<String, dynamic> _$ElementValueToJson(ElementValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'measures': instance.measures,
    };
