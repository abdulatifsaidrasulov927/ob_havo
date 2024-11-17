class MainInMain {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  MainInMain({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory MainInMain.fromJson(Map<String, dynamic> json) {
    return MainInMain(
      temp:
          (json["temp"] as num?)?.toDouble(), // Convert to double if it's a num
      feelsLike: (json["feels_like"] as num?)?.toDouble(),
      tempMin: (json["temp_min"] as num?)?.toDouble(),
      tempMax: (json["temp_max"] as num?)?.toDouble(),
      pressure: json["pressure"] as int,
      humidity: json["humidity"] as int,
      seaLevel: json["sea_level"] as int,
      grndLevel: json["grnd_level"] as int,
    );
  }
}
