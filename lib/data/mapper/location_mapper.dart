import 'package:drift/drift.dart';
import 'package:globenotes/data/dto/location/location_dtos.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/mapper/country_mapper.dart';
import 'package:globenotes/domain/model/model.dart';

extension LocationDetailsDTOToCompanion on LocationDetailsDTO {
  LocationsLocalCompanion toCompanion({
    required int countryLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return LocationsLocalCompanion(
      serverId: Value(id?.toString()),
      latitude: latitude != null ? Value(latitude!) : const Value(0),
      longitude: longitude != null ? Value(longitude!) : const Value(0),
      formattedAddress: Value(formattedAddress),
      city: Value(city),
      state: Value(state),
      googlePlaceId: const Value.absent(),
      countryLocalId: Value(countryLocalId),
      updatedAt: Value(
        DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension LocationDetailsDTOtoLocalData on LocationDetailsDTO {
  LocationsLocalData toLocalData({
    required LocationsLocalData existingData,
    required int countryLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(id.toString()),
      latitude: latitude ?? existingData.latitude,
      longitude: longitude ?? existingData.longitude,
      formattedAddress: Value(formattedAddress),
      city: Value(city),
      state: Value(state),
      googlePlaceId: Value(existingData.googlePlaceId),
      countryLocalId: countryLocalId,
      updatedAt:
          DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? existingData.updatedAt,
      syncStatus: syncStatus,
    );
  }
}

extension LocationsLocalDataToDomain on LocationsLocalData {
  Location toDomain({required Country country}) {
    return Location(
      serverId: serverId ?? '',
      localId: localId,
      latitude: latitude,
      longitude: longitude,
      formattedAddress: formattedAddress,
      city: city,
      state: state,
      googlePlaceId: googlePlaceId,
      updatedAt: updatedAt.toIso8601String(),
      country: country,
    );
  }
}

extension LocationDomainToCompanion on Location {
  LocationsLocalCompanion toCompanion({
    String syncStatus = SyncStatus.pendingAdd,
  }) {
    return LocationsLocalCompanion(
      serverId: Value(serverId ?? ''),
      latitude: Value(latitude),
      longitude: Value(longitude),
      formattedAddress: Value(formattedAddress),
      city: Value(city),
      state: Value(state),
      googlePlaceId: Value(googlePlaceId),
      countryLocalId: Value(country.localId),
      updatedAt: Value(
        DateTime.tryParse(updatedAt)?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension LocationDomainToLocalData on Location {
  LocationsLocalData toLocalData({
    required LocationsLocalData existingData,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(serverId ?? ''),
      latitude: latitude,
      longitude: longitude,
      formattedAddress: Value(formattedAddress),
      city: Value(city),
      state: Value(state),
      googlePlaceId: Value(googlePlaceId ?? existingData.googlePlaceId),
      countryLocalId: country.localId,
      updatedAt:
          DateTime.tryParse(updatedAt)?.toUtc() ?? existingData.updatedAt,
      syncStatus: syncStatus,
    );
  }
}

extension LocationDomainToDetailsDTO on Location {
  LocationDetailsDTO toDetailsDTO() {
    return LocationDetailsDTO(
      id: int.tryParse(serverId ?? ''),
      latitude: latitude,
      longitude: longitude,
      formattedAddress: formattedAddress,
      city: city,
      state: state,
      country: country.toDetailsDTO(),
      updatedAt: updatedAt,
      isDeleted: false,
    );
  }
}
