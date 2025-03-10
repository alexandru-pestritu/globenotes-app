import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/moment/moment_dtos.dart';
import 'package:globenotes/data/mapper/category_mapper.dart';
import 'package:globenotes/data/mapper/location_mapper.dart';
import 'package:globenotes/data/mapper/moment_media_mapper.dart';
import 'package:globenotes/domain/model/model.dart';

extension MomentDetailsDTOToCompanion on MomentDetailsDTO {
  MomentsLocalCompanion toCompanion({
    required int journalLocalId,
    required int locationLocalId,
    int? categoryLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return MomentsLocalCompanion(
      serverId: Value(id?.toString()),
      journalLocalId: Value(journalLocalId),
      locationLocalId: Value(locationLocalId),
      name: Value(name ?? ''),
      description: Value(description),
      categoryLocalId: Value(categoryLocalId ?? 0),
      timestamp: Value(
        DateTime.tryParse(dateTime ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      updatedAt: Value(
        DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension MomentDetailsDTOToLocalData on MomentDetailsDTO {
  MomentsLocalData toLocalData({
    required MomentsLocalData existingData,
    required int locationLocalId,
    int? categoryLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(id?.toString()),
      locationLocalId: locationLocalId,
      name: name ?? '',
      description: Value(description),
      categoryLocalId: categoryLocalId ?? 0,
      timestamp:
          DateTime.tryParse(dateTime ?? '')?.toUtc() ?? existingData.timestamp,
      updatedAt:
          DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? existingData.updatedAt,
      syncStatus: syncStatus,
    );
  }
}

extension MomentsLocalDataToDomain on MomentsLocalData {
  Moment toDomain({
    required Location location,
    Category? category,
    List<MomentMedia>? mediaList,
  }) {
    return Moment(
      serverId: serverId ?? '',
      localId: localId,
      journalId: journalLocalId,
      location: location,
      category: category,
      name: name,
      description: description,
      timestamp: timestamp.toIso8601String(),
      updatedAt: updatedAt.toIso8601String(),
      mediaList: mediaList,
    );
  }
}

extension MomentDomainToCompanion on Moment {
  MomentsLocalCompanion toCompanion({
    String syncStatus = SyncStatus.pendingAdd,
  }) {
    return MomentsLocalCompanion(
      serverId: Value(serverId ?? ''),
      journalLocalId: Value(journalId),
      locationLocalId: Value(location.localId),
      name: Value(name),
      description: Value(description),
      categoryLocalId: Value(category?.localId ?? 0),
      timestamp: Value(
        DateTime.tryParse(timestamp)?.toUtc() ?? DateTime.now().toUtc(),
      ),
      updatedAt: Value(
        DateTime.tryParse(updatedAt)?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension MomentDomainToLocalData on Moment {
  MomentsLocalData toLocalData({
    required MomentsLocalData existingData,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(serverId ?? ''),
      locationLocalId: location.localId,
      name: name,
      description: Value(description),
      categoryLocalId: category?.localId ?? 0,
      timestamp: DateTime.tryParse(timestamp)?.toUtc() 
                 ?? existingData.timestamp,
      updatedAt: DateTime.tryParse(updatedAt)?.toUtc() 
                 ?? existingData.updatedAt,
      syncStatus: syncStatus,
    );
  }
}

extension MomentDomainToDetailsDTO on Moment {
  MomentDetailsDTO toDetailsDTO() {
    return MomentDetailsDTO(
      id: int.tryParse(serverId ?? ''),
      journalId: journalId == 0 ? null : journalId,
      location: location.toDetailsDTO(), 
      name: name,
      description: description,
      category: category?.toDTO(), 
      dateTime: timestamp,
      updatedAt: updatedAt,
      isDeleted: false,
      momentMediaList:
          mediaList.map((media) => media.toDTO()).toList(),
    );
  }
}

