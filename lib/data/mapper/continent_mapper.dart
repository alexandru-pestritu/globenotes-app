import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/continent/continent_dtos.dart';
import 'package:globenotes/domain/model/model.dart';

extension ContinentDTOToCompanion on ContinentDTO {
  ContinentsLocalCompanion toCompanion({
    String syncStatus = SyncStatus.synced,
  }) {
    return ContinentsLocalCompanion(
      serverId: Value(id?.toString()),
      name: Value(name ?? ''),
      code: Value(code),
      syncStatus: Value(syncStatus),
    );
  }
}

extension ContinentLocalDataToDomain on ContinentsLocalData {
  Continent toDomain() {
    return Continent(
      serverId: serverId ?? '',
      localId: localId,
      name: name,
      code: code,
    );
  }
}

extension ContinentDomainToDetailsDTO on Continent {
  ContinentDTO toDTO() {
    return ContinentDTO(
      id: int.tryParse(serverId ?? ''),
      name: name,
      code: code,
    );
  }
}