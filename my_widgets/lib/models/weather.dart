import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherModel extends Object {
  @JsonKey(name: 'success')
  String success;

  @JsonKey(name: 'records')
  Records records;

  WeatherModel(
    this.success,
    this.records,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> srcJson) =>
      _$WeatherFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Records extends Object {
  @JsonKey(name: 'locations')
  List<Locations> locations;

  Records(
    this.locations,
  );

  factory Records.fromJson(Map<String, dynamic> srcJson) =>
      _$RecordsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecordsToJson(this);

  get first => locations[0].location[0];
}

@JsonSerializable()
class Locations extends Object {
  @JsonKey(name: 'datasetDescription')
  String datasetDescription;

  @JsonKey(name: 'locationsName')
  String locationsName;

  @JsonKey(name: 'dataid')
  String dataid;

  @JsonKey(name: 'location')
  List<Location> location;

  Locations(
    this.datasetDescription,
    this.locationsName,
    this.dataid,
    this.location,
  );

  factory Locations.fromJson(Map<String, dynamic> srcJson) =>
      _$LocationsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocationsToJson(this);
}

@JsonSerializable()
class Location extends Object {
  @JsonKey(name: 'locationName')
  String locationName;

  @JsonKey(name: 'geocode')
  String geocode;

  @JsonKey(name: 'lat')
  String lat;

  @JsonKey(name: 'lon')
  String lon;

  @JsonKey(name: 'weatherElement')
  List<WeatherElement> weatherElement;

  Location(
    this.locationName,
    this.geocode,
    this.lat,
    this.lon,
    this.weatherElement,
  );

  factory Location.fromJson(Map<String, dynamic> srcJson) =>
      _$LocationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  WeatherElement element(String type) {
    return weatherElement.firstWhere((element) => element.elementName == type);
  }
}

@JsonSerializable()
class WeatherElement extends Object {
  @JsonKey(name: 'elementName')
  String elementName;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'time')
  List<Time>? time;

  WeatherElement(
    this.elementName,
    this.description,
    this.time,
  );

  factory WeatherElement.fromJson(Map<String, dynamic> srcJson) =>
      _$WeatherElementFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WeatherElementToJson(this);

  Time get now => time![0];
}

@JsonSerializable()
class Time extends Object {
  @JsonKey(name: 'startTime')
  String? startTime;

  @JsonKey(name: 'endTime')
  String? endTime;

  @JsonKey(name: 'elementValue')
  List<ElementValue>? elementValue;

  Time(
    this.startTime,
    this.endTime,
    this.elementValue,
  );

  factory Time.fromJson(Map<String, dynamic> srcJson) =>
      _$TimeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TimeToJson(this);

  List<ElementValue> get values => elementValue!;
}

@JsonSerializable()
class ElementValue extends Object {
  @JsonKey(name: 'value')
  String value;

  @JsonKey(name: 'measures')
  String measures;

  ElementValue(
    this.value,
    this.measures,
  );

  factory ElementValue.fromJson(Map<String, dynamic> srcJson) =>
      _$ElementValueFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ElementValueToJson(this);
}
