// To parse this JSON data, do
//
//     final weatherResponseModel = weatherResponseModelFromJson(jsonString);

import 'dart:convert';

WeatherResponseModel weatherResponseModelFromJson(String str) => WeatherResponseModel.fromJson(json.decode(str));

String weatherResponseModelToJson(WeatherResponseModel data) => json.encode(data.toJson());

class WeatherResponseModel {
  Timelines? timelines;
  Location? location;

  WeatherResponseModel({
    this.timelines,
    this.location,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) => WeatherResponseModel(
    timelines: json["timelines"] == null ? null : Timelines.fromJson(json["timelines"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "timelines": timelines?.toJson(),
    "location": location?.toJson(),
  };
}

class Location {
  double? lat;
  double? lon;
  String? name;
  String? type;

  Location({
    this.lat,
    this.lon,
    this.name,
    this.type,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "name": name,
    "type": type,
  };
}

class Timelines {
  List<Hourly>? minutely;
  List<Hourly>? hourly;
  List<Daily>? daily;

  Timelines({
    this.minutely,
    this.hourly,
    this.daily,
  });

  factory Timelines.fromJson(Map<String, dynamic> json) => Timelines(
    minutely: json["minutely"] == null ? [] : List<Hourly>.from(json["minutely"]!.map((x) => Hourly.fromJson(x))),
    hourly: json["hourly"] == null ? [] : List<Hourly>.from(json["hourly"]!.map((x) => Hourly.fromJson(x))),
    daily: json["daily"] == null ? [] : List<Daily>.from(json["daily"]!.map((x) => Daily.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "minutely": minutely == null ? [] : List<dynamic>.from(minutely!.map((x) => x.toJson())),
    "hourly": hourly == null ? [] : List<dynamic>.from(hourly!.map((x) => x.toJson())),
    "daily": daily == null ? [] : List<dynamic>.from(daily!.map((x) => x.toJson())),
  };
}

class Daily {
  DateTime? time;
  Values? values;

  Daily({
    this.time,
    this.values,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    values: json["values"] == null ? null : Values.fromJson(json["values"]),
  );

  Map<String, dynamic> toJson() => {
    "time": time?.toIso8601String(),
    "values": values?.toJson(),
  };
}

class Values {
  double? cloudBaseAvg;
  double? cloudBaseMax;
  double? cloudBaseMin;
  double? cloudCeilingAvg;
  double? cloudCeilingMax;
  int? cloudCeilingMin;
  double? cloudCoverAvg;
  double? cloudCoverMax;
  double? cloudCoverMin;
  double? dewPointAvg;
  double? dewPointMax;
  double? dewPointMin;
  double? evapotranspirationAvg;
  double? evapotranspirationMax;
  double? evapotranspirationMin;
  double? evapotranspirationSum;
  int? freezingRainIntensityAvg;
  int? freezingRainIntensityMax;
  int? freezingRainIntensityMin;
  double? humidityAvg;
  double? humidityMax;
  double? humidityMin;
  int? iceAccumulationAvg;
  int? iceAccumulationLweAvg;
  int? iceAccumulationLweMax;
  int? iceAccumulationLweMin;
  int? iceAccumulationLweSum;
  int? iceAccumulationMax;
  int? iceAccumulationMin;
  int? iceAccumulationSum;
  DateTime? moonriseTime;
  DateTime? moonsetTime;
  double? precipitationProbabilityAvg;
  int? precipitationProbabilityMax;
  int? precipitationProbabilityMin;
  double? pressureSurfaceLevelAvg;
  double? pressureSurfaceLevelMax;
  double? pressureSurfaceLevelMin;
  double? rainAccumulationAvg;
  double? rainAccumulationLweAvg;
  double? rainAccumulationLweMax;
  double? rainAccumulationLweMin;
  double? rainAccumulationMax;
  int? rainAccumulationMin;
  double? rainAccumulationSum;
  double? rainIntensityAvg;
  double? rainIntensityMax;
  double? rainIntensityMin;
  int? sleetAccumulationAvg;
  int? sleetAccumulationLweAvg;
  int? sleetAccumulationLweMax;
  int? sleetAccumulationLweMin;
  int? sleetAccumulationLweSum;
  int? sleetAccumulationMax;
  int? sleetAccumulationMin;
  int? sleetIntensityAvg;
  int? sleetIntensityMax;
  int? sleetIntensityMin;
  int? snowAccumulationAvg;
  int? snowAccumulationLweAvg;
  int? snowAccumulationLweMax;
  int? snowAccumulationLweMin;
  int? snowAccumulationLweSum;
  int? snowAccumulationMax;
  int? snowAccumulationMin;
  int? snowAccumulationSum;
  int? snowIntensityAvg;
  int? snowIntensityMax;
  int? snowIntensityMin;
  DateTime? sunriseTime;
  DateTime? sunsetTime;
  double? temperatureApparentAvg;
  double? temperatureApparentMax;
  double? temperatureApparentMin;
  double? temperatureAvg;
  double? temperatureMax;
  double? temperatureMin;
  int? uvHealthConcernAvg;
  int? uvHealthConcernMax;
  int? uvHealthConcernMin;
  int? uvIndexAvg;
  int? uvIndexMax;
  int? uvIndexMin;
  double? visibilityAvg;
  double? visibilityMax;
  double? visibilityMin;
  int? weatherCodeMax;
  int? weatherCodeMin;
  double? windDirectionAvg;
  double? windGustAvg;
  double? windGustMax;
  double? windGustMin;
  double? windSpeedAvg;
  double? windSpeedMax;
  double? windSpeedMin;

  Values({
    this.cloudBaseAvg,
    this.cloudBaseMax,
    this.cloudBaseMin,
    this.cloudCeilingAvg,
    this.cloudCeilingMax,
    this.cloudCeilingMin,
    this.cloudCoverAvg,
    this.cloudCoverMax,
    this.cloudCoverMin,
    this.dewPointAvg,
    this.dewPointMax,
    this.dewPointMin,
    this.evapotranspirationAvg,
    this.evapotranspirationMax,
    this.evapotranspirationMin,
    this.evapotranspirationSum,
    this.freezingRainIntensityAvg,
    this.freezingRainIntensityMax,
    this.freezingRainIntensityMin,
    this.humidityAvg,
    this.humidityMax,
    this.humidityMin,
    this.iceAccumulationAvg,
    this.iceAccumulationLweAvg,
    this.iceAccumulationLweMax,
    this.iceAccumulationLweMin,
    this.iceAccumulationLweSum,
    this.iceAccumulationMax,
    this.iceAccumulationMin,
    this.iceAccumulationSum,
    this.moonriseTime,
    this.moonsetTime,
    this.precipitationProbabilityAvg,
    this.precipitationProbabilityMax,
    this.precipitationProbabilityMin,
    this.pressureSurfaceLevelAvg,
    this.pressureSurfaceLevelMax,
    this.pressureSurfaceLevelMin,
    this.rainAccumulationAvg,
    this.rainAccumulationLweAvg,
    this.rainAccumulationLweMax,
    this.rainAccumulationLweMin,
    this.rainAccumulationMax,
    this.rainAccumulationMin,
    this.rainAccumulationSum,
    this.rainIntensityAvg,
    this.rainIntensityMax,
    this.rainIntensityMin,
    this.sleetAccumulationAvg,
    this.sleetAccumulationLweAvg,
    this.sleetAccumulationLweMax,
    this.sleetAccumulationLweMin,
    this.sleetAccumulationLweSum,
    this.sleetAccumulationMax,
    this.sleetAccumulationMin,
    this.sleetIntensityAvg,
    this.sleetIntensityMax,
    this.sleetIntensityMin,
    this.snowAccumulationAvg,
    this.snowAccumulationLweAvg,
    this.snowAccumulationLweMax,
    this.snowAccumulationLweMin,
    this.snowAccumulationLweSum,
    this.snowAccumulationMax,
    this.snowAccumulationMin,
    this.snowAccumulationSum,
    this.snowIntensityAvg,
    this.snowIntensityMax,
    this.snowIntensityMin,
    this.sunriseTime,
    this.sunsetTime,
    this.temperatureApparentAvg,
    this.temperatureApparentMax,
    this.temperatureApparentMin,
    this.temperatureAvg,
    this.temperatureMax,
    this.temperatureMin,
    this.uvHealthConcernAvg,
    this.uvHealthConcernMax,
    this.uvHealthConcernMin,
    this.uvIndexAvg,
    this.uvIndexMax,
    this.uvIndexMin,
    this.visibilityAvg,
    this.visibilityMax,
    this.visibilityMin,
    this.weatherCodeMax,
    this.weatherCodeMin,
    this.windDirectionAvg,
    this.windGustAvg,
    this.windGustMax,
    this.windGustMin,
    this.windSpeedAvg,
    this.windSpeedMax,
    this.windSpeedMin,
  });

  factory Values.fromJson(Map<String, dynamic> json) => Values(
    cloudBaseAvg: json["cloudBaseAvg"]?.toDouble(),
    cloudBaseMax: json["cloudBaseMax"]?.toDouble(),
    cloudBaseMin: json["cloudBaseMin"]?.toDouble(),
    cloudCeilingAvg: json["cloudCeilingAvg"]?.toDouble(),
    cloudCeilingMax: json["cloudCeilingMax"]?.toDouble(),
    cloudCeilingMin: json["cloudCeilingMin"],
    cloudCoverAvg: json["cloudCoverAvg"]?.toDouble(),
    cloudCoverMax: json["cloudCoverMax"]?.toDouble(),
    cloudCoverMin: json["cloudCoverMin"]?.toDouble(),
    dewPointAvg: json["dewPointAvg"]?.toDouble(),
    dewPointMax: json["dewPointMax"]?.toDouble(),
    dewPointMin: json["dewPointMin"]?.toDouble(),
    evapotranspirationAvg: json["evapotranspirationAvg"]?.toDouble(),
    evapotranspirationMax: json["evapotranspirationMax"]?.toDouble(),
    evapotranspirationMin: json["evapotranspirationMin"]?.toDouble(),
    evapotranspirationSum: json["evapotranspirationSum"]?.toDouble(),
    freezingRainIntensityAvg: json["freezingRainIntensityAvg"],
    freezingRainIntensityMax: json["freezingRainIntensityMax"],
    freezingRainIntensityMin: json["freezingRainIntensityMin"],
    humidityAvg: json["humidityAvg"]?.toDouble(),
    humidityMax: json["humidityMax"]?.toDouble(),
    humidityMin: json["humidityMin"]?.toDouble(),
    iceAccumulationAvg: json["iceAccumulationAvg"],
    iceAccumulationLweAvg: json["iceAccumulationLweAvg"],
    iceAccumulationLweMax: json["iceAccumulationLweMax"],
    iceAccumulationLweMin: json["iceAccumulationLweMin"],
    iceAccumulationLweSum: json["iceAccumulationLweSum"],
    iceAccumulationMax: json["iceAccumulationMax"],
    iceAccumulationMin: json["iceAccumulationMin"],
    iceAccumulationSum: json["iceAccumulationSum"],
    moonriseTime: json["moonriseTime"] == null ? null : DateTime.parse(json["moonriseTime"]),
    moonsetTime: json["moonsetTime"] == null ? null : DateTime.parse(json["moonsetTime"]),
    precipitationProbabilityAvg: json["precipitationProbabilityAvg"]?.toDouble(),
    precipitationProbabilityMax: json["precipitationProbabilityMax"],
    precipitationProbabilityMin: json["precipitationProbabilityMin"],
    pressureSurfaceLevelAvg: json["pressureSurfaceLevelAvg"]?.toDouble(),
    pressureSurfaceLevelMax: json["pressureSurfaceLevelMax"]?.toDouble(),
    pressureSurfaceLevelMin: json["pressureSurfaceLevelMin"]?.toDouble(),
    rainAccumulationAvg: json["rainAccumulationAvg"]?.toDouble(),
    rainAccumulationLweAvg: json["rainAccumulationLweAvg"]?.toDouble(),
    rainAccumulationLweMax: json["rainAccumulationLweMax"]?.toDouble(),
    rainAccumulationLweMin: json["rainAccumulationLweMin"].toDouble(),
    rainAccumulationMax: json["rainAccumulationMax"]?.toDouble(),
    rainAccumulationMin: json["rainAccumulationMin"],
    rainAccumulationSum: json["rainAccumulationSum"]?.toDouble(),
    rainIntensityAvg: json["rainIntensityAvg"]?.toDouble(),
    rainIntensityMax: json["rainIntensityMax"]?.toDouble(),
    rainIntensityMin: 0.0,
    // rainIntensityMin: double.parse(json["rainIntensityMin"]),
    sleetAccumulationAvg: json["sleetAccumulationAvg"],
    sleetAccumulationLweAvg: json["sleetAccumulationLweAvg"],
    sleetAccumulationLweMax: json["sleetAccumulationLweMax"],
    sleetAccumulationLweMin: json["sleetAccumulationLweMin"],
    sleetAccumulationLweSum: json["sleetAccumulationLweSum"],
    sleetAccumulationMax: json["sleetAccumulationMax"],
    sleetAccumulationMin: json["sleetAccumulationMin"],
    sleetIntensityAvg: json["sleetIntensityAvg"],
    sleetIntensityMax: json["sleetIntensityMax"],
    sleetIntensityMin: json["sleetIntensityMin"],
    snowAccumulationAvg: json["snowAccumulationAvg"],
    snowAccumulationLweAvg: json["snowAccumulationLweAvg"],
    snowAccumulationLweMax: json["snowAccumulationLweMax"],
    snowAccumulationLweMin: json["snowAccumulationLweMin"],
    snowAccumulationLweSum: json["snowAccumulationLweSum"],
    snowAccumulationMax: json["snowAccumulationMax"],
    snowAccumulationMin: json["snowAccumulationMin"],
    snowAccumulationSum: json["snowAccumulationSum"],
    snowIntensityAvg: json["snowIntensityAvg"],
    snowIntensityMax: json["snowIntensityMax"],
    snowIntensityMin: json["snowIntensityMin"],
    sunriseTime: json["sunriseTime"] == null ? null : DateTime.parse(json["sunriseTime"]),
    sunsetTime: json["sunsetTime"] == null ? null : DateTime.parse(json["sunsetTime"]),
    temperatureApparentAvg: json["temperatureApparentAvg"]?.toDouble(),
    temperatureApparentMax: json["temperatureApparentMax"]?.toDouble(),
    temperatureApparentMin: json["temperatureApparentMin"]?.toDouble(),
    temperatureAvg: json["temperatureAvg"]?.toDouble(),
    temperatureMax: json["temperatureMax"]?.toDouble(),
    temperatureMin: json["temperatureMin"]?.toDouble(),
    uvHealthConcernAvg: json["uvHealthConcernAvg"],
    uvHealthConcernMax: json["uvHealthConcernMax"],
    uvHealthConcernMin: json["uvHealthConcernMin"],
    uvIndexAvg: json["uvIndexAvg"],
    uvIndexMax: json["uvIndexMax"],
    uvIndexMin: json["uvIndexMin"],
    visibilityAvg: json["visibilityAvg"]?.toDouble(),
    visibilityMax: json["visibilityMax"]?.toDouble(),
    visibilityMin: json["visibilityMin"]?.toDouble(),
    weatherCodeMax: json["weatherCodeMax"],
    weatherCodeMin: json["weatherCodeMin"],
    windDirectionAvg: json["windDirectionAvg"]?.toDouble(),
    windGustAvg: json["windGustAvg"]?.toDouble(),
    windGustMax: json["windGustMax"]?.toDouble(),
    windGustMin: json["windGustMin"]?.toDouble(),
    windSpeedAvg: json["windSpeedAvg"]?.toDouble(),
    windSpeedMax: json["windSpeedMax"]?.toDouble(),
    windSpeedMin: json["windSpeedMin"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "cloudBaseAvg": cloudBaseAvg,
    "cloudBaseMax": cloudBaseMax,
    "cloudBaseMin": cloudBaseMin,
    "cloudCeilingAvg": cloudCeilingAvg,
    "cloudCeilingMax": cloudCeilingMax,
    "cloudCeilingMin": cloudCeilingMin,
    "cloudCoverAvg": cloudCoverAvg,
    "cloudCoverMax": cloudCoverMax,
    "cloudCoverMin": cloudCoverMin,
    "dewPointAvg": dewPointAvg,
    "dewPointMax": dewPointMax,
    "dewPointMin": dewPointMin,
    "evapotranspirationAvg": evapotranspirationAvg,
    "evapotranspirationMax": evapotranspirationMax,
    "evapotranspirationMin": evapotranspirationMin,
    "evapotranspirationSum": evapotranspirationSum,
    "freezingRainIntensityAvg": freezingRainIntensityAvg,
    "freezingRainIntensityMax": freezingRainIntensityMax,
    "freezingRainIntensityMin": freezingRainIntensityMin,
    "humidityAvg": humidityAvg,
    "humidityMax": humidityMax,
    "humidityMin": humidityMin,
    "iceAccumulationAvg": iceAccumulationAvg,
    "iceAccumulationLweAvg": iceAccumulationLweAvg,
    "iceAccumulationLweMax": iceAccumulationLweMax,
    "iceAccumulationLweMin": iceAccumulationLweMin,
    "iceAccumulationLweSum": iceAccumulationLweSum,
    "iceAccumulationMax": iceAccumulationMax,
    "iceAccumulationMin": iceAccumulationMin,
    "iceAccumulationSum": iceAccumulationSum,
    "moonriseTime": moonriseTime?.toIso8601String(),
    "moonsetTime": moonsetTime?.toIso8601String(),
    "precipitationProbabilityAvg": precipitationProbabilityAvg,
    "precipitationProbabilityMax": precipitationProbabilityMax,
    "precipitationProbabilityMin": precipitationProbabilityMin,
    "pressureSurfaceLevelAvg": pressureSurfaceLevelAvg,
    "pressureSurfaceLevelMax": pressureSurfaceLevelMax,
    "pressureSurfaceLevelMin": pressureSurfaceLevelMin,
    "rainAccumulationAvg": rainAccumulationAvg,
    "rainAccumulationLweAvg": rainAccumulationLweAvg,
    "rainAccumulationLweMax": rainAccumulationLweMax,
    "rainAccumulationLweMin": rainAccumulationLweMin,
    "rainAccumulationMax": rainAccumulationMax,
    "rainAccumulationMin": rainAccumulationMin,
    "rainAccumulationSum": rainAccumulationSum,
    "rainIntensityAvg": rainIntensityAvg,
    "rainIntensityMax": rainIntensityMax,
    "rainIntensityMin": rainIntensityMin,
    "sleetAccumulationAvg": sleetAccumulationAvg,
    "sleetAccumulationLweAvg": sleetAccumulationLweAvg,
    "sleetAccumulationLweMax": sleetAccumulationLweMax,
    "sleetAccumulationLweMin": sleetAccumulationLweMin,
    "sleetAccumulationLweSum": sleetAccumulationLweSum,
    "sleetAccumulationMax": sleetAccumulationMax,
    "sleetAccumulationMin": sleetAccumulationMin,
    "sleetIntensityAvg": sleetIntensityAvg,
    "sleetIntensityMax": sleetIntensityMax,
    "sleetIntensityMin": sleetIntensityMin,
    "snowAccumulationAvg": snowAccumulationAvg,
    "snowAccumulationLweAvg": snowAccumulationLweAvg,
    "snowAccumulationLweMax": snowAccumulationLweMax,
    "snowAccumulationLweMin": snowAccumulationLweMin,
    "snowAccumulationLweSum": snowAccumulationLweSum,
    "snowAccumulationMax": snowAccumulationMax,
    "snowAccumulationMin": snowAccumulationMin,
    "snowAccumulationSum": snowAccumulationSum,
    "snowIntensityAvg": snowIntensityAvg,
    "snowIntensityMax": snowIntensityMax,
    "snowIntensityMin": snowIntensityMin,
    "sunriseTime": sunriseTime?.toIso8601String(),
    "sunsetTime": sunsetTime?.toIso8601String(),
    "temperatureApparentAvg": temperatureApparentAvg,
    "temperatureApparentMax": temperatureApparentMax,
    "temperatureApparentMin": temperatureApparentMin,
    "temperatureAvg": temperatureAvg,
    "temperatureMax": temperatureMax,
    "temperatureMin": temperatureMin,
    "uvHealthConcernAvg": uvHealthConcernAvg,
    "uvHealthConcernMax": uvHealthConcernMax,
    "uvHealthConcernMin": uvHealthConcernMin,
    "uvIndexAvg": uvIndexAvg,
    "uvIndexMax": uvIndexMax,
    "uvIndexMin": uvIndexMin,
    "visibilityAvg": visibilityAvg,
    "visibilityMax": visibilityMax,
    "visibilityMin": visibilityMin,
    "weatherCodeMax": weatherCodeMax,
    "weatherCodeMin": weatherCodeMin,
    "windDirectionAvg": windDirectionAvg,
    "windGustAvg": windGustAvg,
    "windGustMax": windGustMax,
    "windGustMin": windGustMin,
    "windSpeedAvg": windSpeedAvg,
    "windSpeedMax": windSpeedMax,
    "windSpeedMin": windSpeedMin,
  };
}

class Hourly {
  DateTime? time;
  Map<String, double?>? values;

  Hourly({
    this.time,
    this.values,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    values: Map.from(json["values"]!).map((k, v) => MapEntry<String, double?>(k, v?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "time": time?.toIso8601String(),
    "values": Map.from(values!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
