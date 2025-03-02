import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/user/user_dtos.dart';
import 'package:globenotes/domain/model/model.dart';

extension UserDTOMapper on UserDTO {
  User toDomain() {
    return User(id ?? 0, email ?? '', isVerified ?? false, updatedAt ?? '');
  }
}

extension UserMapper on User {
  UserDTO toDTO() {
    return UserDTO(
      id: id,
      email: email,
      isVerified: isVerified,
      updatedAt: updatedAt,
    );
  }
}

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
