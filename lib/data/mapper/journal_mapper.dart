import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/journal/journal_dtos.dart';
import 'package:globenotes/data/mapper/location_mapper.dart';
import 'package:globenotes/domain/model/model.dart';

extension JournalDTOToCompanion on JournalDTO {
  JournalsLocalCompanion toCompanion({
    required int userLocalId,
    required int locationLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return JournalsLocalCompanion(
      serverId: Value(id?.toString()),
      userLocalId: Value(userLocalId),
      name: Value(name ?? ''),
      shortSummary: Value(shortSummary),
      locationLocalId: Value(locationLocalId),
      startDate: Value(
        DateTime.tryParse(startDate ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      endDate: Value(
        DateTime.tryParse(endDate ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      coverPhotoUrl: Value(coverPhotoUrl),
      coverLocalFilePath: const Value.absent(),
      remindersEnabled: Value(remindersEnabled ?? false),
      updatedAt: Value(
        DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension JournalDTOToLocalData on JournalDTO {
  JournalsLocalData toLocalData({
    required JournalsLocalData existingData,
    required int locationLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(id?.toString()),
      name: name ?? '',
      shortSummary: Value(shortSummary),
      locationLocalId: locationLocalId,
      startDate:
          DateTime.tryParse(startDate ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      endDate: Value(
        DateTime.tryParse(endDate ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      coverPhotoUrl: Value(coverPhotoUrl),
      coverLocalFilePath: Value(existingData.coverLocalFilePath),
      remindersEnabled: remindersEnabled ?? false,
      updatedAt:
          DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      syncStatus: syncStatus,
    );
  }
}

extension JournalLocalDataToDomain on JournalsLocalData {
  Journal toDomain({required Location location}) {
    return Journal(
      serverId: serverId ?? '',
      localId: localId,
      name: name,
      shortSummary: shortSummary,
      location: location,
      startDate: startDate.toIso8601String(),
      endDate: endDate?.toIso8601String(),
      coverPhotoUrl: coverPhotoUrl,
      coverLocalFilePath: coverLocalFilePath,
      remindersEnabled: remindersEnabled,
      updatedAt: updatedAt.toIso8601String(),
    );
  }
}

extension JournalDomainToCompanion on Journal {
  JournalsLocalCompanion toCompanion({
    required int userLocalId,
    String syncStatus = SyncStatus.pendingAdd,
  }) {
    return JournalsLocalCompanion(
      serverId: Value(serverId ?? ''),
      userLocalId: Value(userLocalId),
      name: Value(name),
      shortSummary: Value(shortSummary),
      locationLocalId: Value(location.localId),
      startDate: Value(
        DateTime.tryParse(startDate)?.toUtc() ?? DateTime.now().toUtc(),
      ),
      endDate: Value(
        endDate != null ? DateTime.tryParse(endDate!)?.toUtc() : null,
      ),
      coverPhotoUrl: Value(coverPhotoUrl),
      coverLocalFilePath:
          coverLocalFilePath != null
              ? Value(coverLocalFilePath!)
              : const Value.absent(),
      remindersEnabled: Value(remindersEnabled),
      updatedAt: Value(
        DateTime.tryParse(updatedAt)?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension JournalDomainToLocalData on Journal {
  JournalsLocalData toLocalData({
    required JournalsLocalData existingData,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(serverId ?? ''),
      name: name,
      shortSummary: Value(shortSummary),
      locationLocalId: location.localId,
      startDate:
          DateTime.tryParse(startDate)?.toUtc() ?? existingData.startDate,
      endDate: Value(
        DateTime.tryParse(endDate ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      coverPhotoUrl: Value(coverPhotoUrl),
      coverLocalFilePath: Value(
        coverLocalFilePath ?? existingData.coverLocalFilePath,
      ),
      remindersEnabled: remindersEnabled,
      updatedAt:
          DateTime.tryParse(updatedAt)?.toUtc() ?? existingData.updatedAt,
      syncStatus: syncStatus,
    );
  }
}

extension JournalDomainToDTO on Journal {
  JournalDTO toDTO() {
    return JournalDTO(
      id: int.tryParse(serverId ?? ''),
      userId: null,
      name: name,
      shortSummary: shortSummary,
      tripLocation: location.toDetailsDTO(),
      coverPhotoUrl: coverPhotoUrl,
      startDate: startDate,
      endDate: endDate,
      remindersEnabled: remindersEnabled,
      updatedAt: updatedAt,
      isDeleted: false,
    );
  }
}