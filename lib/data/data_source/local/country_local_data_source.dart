import 'package:globenotes/data/database/app_database.dart';

abstract class CountriesLocalDataSource {
  Future<CountriesLocalData> insertCountry(CountriesLocalCompanion country);
  Future<List<CountriesLocalData>> getAllCountries();
  Future<CountriesLocalData> getCountry(int localId);
  Future<bool> updateCountry(CountriesLocalData country);
  Future<int> deleteCountry(int localId);
  Future<int> deleteAllCountries();
}

class CountriesLocalDataSourceImpl implements CountriesLocalDataSource {
  final AppDatabase _db;

  CountriesLocalDataSourceImpl(this._db);

  @override
  Future<CountriesLocalData> insertCountry(CountriesLocalCompanion country) async {
    if (country.serverId.present && country.serverId.value != null) {
      final existing = await (_db.select(_db.countriesLocal)
            ..where((tbl) => tbl.serverId.equals(country.serverId.value!)))
          .getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final countryId = await _db.into(_db.countriesLocal).insert(country);
    return await (_db.select(_db.countriesLocal)
          ..where((tbl) => tbl.localId.equals(countryId)))
        .getSingle();
  }

  @override
  Future<List<CountriesLocalData>> getAllCountries() {
    return _db.select(_db.countriesLocal).get();
  }

  @override
  Future<CountriesLocalData> getCountry(int localId) {
    return (_db.select(_db.countriesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateCountry(CountriesLocalData country) {
    return _db.update(_db.countriesLocal).replace(country);
  }

  @override
  Future<int> deleteCountry(int localId) {
    return (_db.delete(_db.countriesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllCountries() {
    return _db.delete(_db.countriesLocal).go();
  }
}
