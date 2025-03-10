import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/country/country_dtos.dart';
import 'package:globenotes/data/mapper/continent_mapper.dart';
import 'package:globenotes/domain/model/model.dart';

extension CountryDTOToCompanion on CountryDTO {
  CountriesLocalCompanion toCompanion({
    required int continentLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return CountriesLocalCompanion(
      serverId: Value(id?.toString()),
      continentLocalId: Value(continentLocalId),
      name: Value(name ?? ''),
      isoCode: Value(isoCode),
      syncStatus: Value(syncStatus),
    );
  }
}

extension CountryLocalDataToDomain on CountriesLocalData {
  Country toDomain({
    required Continent continent,
  }) {
    return Country(
      serverId: serverId ?? '',
      localId: localId,
      name: name,
      isoCode: isoCode,
      continent: continent,
    );
  }
}

extension CountryDomainToDetailsDTO on Country {
  CountryDetailsDTO toDetailsDTO() {
    return CountryDetailsDTO(
      id: int.tryParse(serverId ?? ''),
      name: name,
      isoCode: isoCode,
      continent: continent.toDTO(),
    );
  }
}