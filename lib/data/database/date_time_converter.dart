import 'package:drift/drift.dart';

class DateTimeConverter extends TypeConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromSql(String fromDb) {
    return DateTime.parse(fromDb).toUtc();
  }

  @override
  String toSql(DateTime value) {
    return value.toUtc().toIso8601String();
  }
}
