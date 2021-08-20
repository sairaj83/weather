// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Welcome {
  Welcome({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Rain? rain;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        coord: Coord.fromMap(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        base: json["base"],
        main: Main.fromMap(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromMap(json["wind"]),
        rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
        clouds: Clouds.fromMap(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromMap(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toMap() => {
        "coord": coord!.toMap(),
        "weather": List<dynamic>.from(weather!.map((x) => x.toMap())),
        "base": base,
        "main": main!.toMap(),
        "visibility": visibility,
        "wind": wind!.toMap(),
        "rain": rain!.toMap(),
        "clouds": clouds!.toMap(),
        "dt": dt,
        "sys": sys!.toMap(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  Clouds({
    this.all,
  });

  int? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toMap() => {
        "all": all,
      };
}

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  double? lon;
  double? lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  factory Main.fromJson(Map<String, dynamic> json) => Main.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Main.fromMap(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
      );

  Map<String, dynamic> toMap() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };
}

class Rain {
  Rain({
    this.the1H,
  });

  double? the1H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Rain.fromMap(Map<String, dynamic> json) => Rain(
        the1H: json["1h"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "1h": the1H,
      };
}

class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  double? speed;
  int? deg;
  double? gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"] == null ? null : json["gust"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
