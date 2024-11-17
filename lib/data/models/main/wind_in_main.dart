class WindInMain {
  final double speed;
  final int deg;
  final double gust;

  WindInMain({
    required this.deg,
    required this.gust,
    required this.speed,
  });

  factory WindInMain.fromJson(Map<String, Object?> json) {
    return WindInMain(
      deg: json["deg"] as int? ?? 0,
      gust: (json["gust"] as num?)?.toDouble() ?? 0.0, // Ensure it's double
      speed: (json["speed"] as num?)?.toDouble() ?? 0.0, // Ensure it's double
    );
  }
}
