import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/domain/model/model.dart';

extension SyncHistoryDataToDomain on SyncHistoryData {
  SyncHistoryEntry toDomain() {
    return SyncHistoryEntry(
      localId: localId,
      syncStatus: syncStatus,
      syncType: syncType,
      syncTime: syncTime.toIso8601String(),
      syncMessage: syncMessage,
    );
  }
}

extension SyncHistoryDomainToCompanion on SyncHistoryEntry {
  SyncHistoryCompanion toCompanion() {
    final parsedTime = DateTime.tryParse(syncTime) ?? DateTime.now().toUtc();

    return SyncHistoryCompanion(
      syncStatus: Value(syncStatus),
      syncType: Value(syncType),
      syncTime: Value(parsedTime),
      syncMessage: Value(syncMessage),
    );
  }
}
