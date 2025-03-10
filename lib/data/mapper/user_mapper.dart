import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/user/user_dtos.dart';
import 'package:globenotes/domain/model/model.dart';

extension UserDTOToLocalCompanion on UserDTO {
  UsersLocalCompanion toCompanion() {
    return UsersLocalCompanion(
      serverId: Value(id?.toString()),
      email: Value(email ?? ''),
      isVerified: Value(isVerified ?? false),
      updatedAt: Value(
        DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(SyncStatus.synced), 
    );
  }
}

extension UserLocalDataToDomain on UsersLocalData {
  User toDomain() {
    return User(
      serverId ?? '',
      localId,
      email,
      isVerified,
      updatedAt.toIso8601String(),
    );
  }
}

extension UserDTOToLocalData on UserDTO {
  UsersLocalData toLocalData({
    int? localId,
    String syncStatus = SyncStatus.synced,
  }) {
    return UsersLocalData(
      localId: localId ?? 0,
      serverId: id?.toString(),
      email: email ?? '',
      isVerified: isVerified ?? false,
      updatedAt:
          DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      syncStatus: syncStatus,
    );
  }
}

