class DistanceUnit {
  final String key;
  final String translationKey;

  const DistanceUnit(this.key, this.translationKey);

  static const DistanceUnit kilometers =
      DistanceUnit('km', 'distance_unit_kilometers');
  static const DistanceUnit miles =
      DistanceUnit('miles', 'distance_unit_miles');

  static List<DistanceUnit> get values => [kilometers, miles];

  static DistanceUnit fromKey(String key) {
    return values.firstWhere(
      (element) => element.key == key,
      orElse: () => kilometers,
    );
  }
}

class TemperatureUnit {
  final String key;
  final String translationKey;

  const TemperatureUnit(this.key, this.translationKey);

  static const TemperatureUnit celsius =
      TemperatureUnit('celsius', 'temperature_unit_celsius');
  static const TemperatureUnit fahrenheit =
      TemperatureUnit('fahrenheit', 'temperature_unit_fahrenheit');

  static List<TemperatureUnit> get values => [celsius, fahrenheit];

  static TemperatureUnit fromKey(String key) {
    return values.firstWhere(
      (element) => element.key == key,
      orElse: () => celsius,
    );
  }
}