import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/moment_media/moment_media_dtos.dart';
import 'package:globenotes/domain/model/model.dart';

extension MomentMediaDTOToCompanion on MomentMediaDTO {
  MomentMediaLocalCompanion toCompanion({
    required int momentLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return MomentMediaLocalCompanion(
      serverId: Value(id?.toString()),
      momentLocalId: Value(momentLocalId),
      mediaUrl: Value(mediaUrl ?? ''),
      mediaType: Value(mediaType),
      localFilePath: const Value.absent(),
      updatedAt: Value(
        DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension MomentMediaLocalDataToDomain on MomentMediaLocalData {
  MomentMedia toDomain() {
    return MomentMedia(
      serverId: serverId ?? '',
      localId: localId,
      momentId: momentLocalId,
      mediaUrl: mediaUrl,
      mediaType: mediaType,
      localFilePath: localFilePath,
      updatedAt: updatedAt.toIso8601String(),
    );
  }
}

extension MomentMediaDTOToLocalData on MomentMediaDTO {
  MomentMediaLocalData toLocalData({
    required MomentMediaLocalData existingData,
    required int momentLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(id?.toString()),
      momentLocalId: momentLocalId,
      mediaUrl: mediaUrl ?? '',
      mediaType: Value(mediaType),
      localFilePath: Value(existingData.localFilePath),
      updatedAt:
          DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      syncStatus: syncStatus,
    );
  }
}

extension MomentMediaDomainToCompanion on MomentMedia {
  MomentMediaLocalCompanion toCompanion({
    String syncStatus = SyncStatus.pendingAdd,
  }) {
    return MomentMediaLocalCompanion(
      serverId: Value(serverId ?? ''),
      momentLocalId: Value(momentId),
      mediaUrl: Value(mediaUrl),
      mediaType: Value(mediaType),
      localFilePath:
          localFilePath != null ? Value(localFilePath!) : const Value.absent(),
      updatedAt: Value(
        DateTime.tryParse(updatedAt)?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension MomentMediaDomainToLocalData on MomentMedia {
  MomentMediaLocalData toLocalData({
    required MomentMediaLocalData existingData,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(serverId ?? ''),
      momentLocalId: momentId,
      mediaUrl: mediaUrl,
      mediaType: Value(mediaType),
      localFilePath: Value(localFilePath ?? existingData.localFilePath),
      updatedAt:
          DateTime.tryParse(updatedAt)?.toUtc() ?? existingData.updatedAt,
      syncStatus: syncStatus,
    );
  }
}

extension MomentMediaDomainToDTO on MomentMedia {
  MomentMediaDTO toDTO() {
    return MomentMediaDTO(
      id: int.tryParse(serverId ?? ''),
      momentId: momentId == 0 ? null : momentId,
      mediaUrl: mediaUrl,
      mediaType: mediaType,
      updatedAt: updatedAt,
      isDeleted: false,
    );
  }
}
