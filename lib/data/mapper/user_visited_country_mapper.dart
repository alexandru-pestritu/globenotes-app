import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/user_visited_country/user_visited_country_dtos.dart';
import 'package:globenotes/data/mapper/country_mapper.dart';
import 'package:globenotes/domain/model/model.dart';

extension UserVisitedCountryDetailsDTOToCompanion
    on UserVisitedCountryDetailsDTO {
  UserVisitedCountriesLocalCompanion toCompanion({
    required int userLocalId,
    required int countryLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return UserVisitedCountriesLocalCompanion(
      serverId: Value(id?.toString()),
      userLocalId: Value(userLocalId),
      countryLocalId: Value(countryLocalId),
      visitedAt: Value(
        DateTime.tryParse(visitedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension UserVisitedCountryDetailsDTOToLocalData
    on UserVisitedCountryDetailsDTO {
  UserVisitedCountriesLocalData toLocalData({
    required UserVisitedCountriesLocalData existingData,
    required int userLocalId,
    required int countryLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(id?.toString()),
      userLocalId: userLocalId,
      countryLocalId: countryLocalId,
      visitedAt:
          DateTime.tryParse(visitedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      syncStatus: syncStatus,
    );
  }
}

extension UserVisitedCountryLocalDataToDomain on UserVisitedCountriesLocalData {
  UserVisitedCountry toDomain({required Country country}) {
    return UserVisitedCountry(
      serverId: serverId ?? '',
      localId: localId,
      userId: userLocalId,
      country: country,
      visitedAt: visitedAt.toIso8601String(),
    );
  }
}

extension UserVisitedCountryToCompanion on UserVisitedCountry {
  UserVisitedCountriesLocalCompanion toCompanion({
    String syncStatus = SyncStatus.pendingAdd,
  }) {
    return UserVisitedCountriesLocalCompanion(
      serverId: Value(serverId ?? ''),
      userLocalId: Value(userId),
      countryLocalId: Value(country.localId),
      visitedAt: Value(
        DateTime.tryParse(visitedAt)?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension UserVisitedCountryToLocalData on UserVisitedCountry {
  UserVisitedCountriesLocalData toLocalData({
    required UserVisitedCountriesLocalData existingData,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(serverId ?? ''),
      userLocalId: userId,
      countryLocalId: country.localId,
      visitedAt:
          DateTime.tryParse(visitedAt)?.toUtc() ?? existingData.visitedAt,
      syncStatus: syncStatus,
    );
  }
}

extension UserVisitedCountryToDetailsDTO on UserVisitedCountry {
  UserVisitedCountryDetailsDTO toDetailsDTO() {
    return UserVisitedCountryDetailsDTO(
      id: int.tryParse(serverId ?? ''),
      userId: userId,
      country: country.toDetailsDTO(),
      visitedAt: visitedAt,
      isDeleted: false,
    );
  }
}
