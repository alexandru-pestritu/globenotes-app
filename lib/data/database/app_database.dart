import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:globenotes/app/constants.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:globenotes/data/database/sync_status.dart';

part 'app_database.g.dart';

class ContinentsLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final name = text()();
  late final code = text().nullable()();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class CountriesLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final continentLocalId =
      integer().references(ContinentsLocal, #localId)();

  late final name = text()();
  late final isoCode = text().nullable()();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class LocationsLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final latitude = real()();
  late final longitude = real()();

  late final formattedAddress = text().nullable()();
  late final city = text().nullable()();
  late final state = text().nullable()();

  late final googlePlaceId = text().nullable()();

  late final countryLocalId = integer().references(CountriesLocal, #localId)();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class UsersLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final email = text()();
  late final isVerified = boolean()();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class UserProfilesLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final userLocalId = integer().references(UsersLocal, #localId)();

  late final name = text()();

  late final profilePhotoUrl = text().nullable()();
  late final coverPhotoUrl = text().nullable()();

  late final profileLocalFilePath = text().nullable()();
  late final coverLocalFilePath = text().nullable()();

  late final bio = text().nullable()();
  late final locationLocalId = integer().references(LocationsLocal, #localId)();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class UserVisitedCountriesLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final userLocalId = integer().references(UsersLocal, #localId)();
  late final countryLocalId = integer().references(CountriesLocal, #localId)();

  late final visitedAt = dateTime()();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class JournalsLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final userLocalId = integer().references(UsersLocal, #localId)();

  late final name = text()();
  late final shortSummary = text().nullable()();

  late final locationLocalId = integer().references(LocationsLocal, #localId)();

  late final startDate = dateTime()();
  late final endDate = dateTime().nullable()();

  late final coverPhotoUrl = text().nullable()();
  late final coverLocalFilePath = text().nullable()();

  late final remindersEnabled = boolean()();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class CategoriesLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final name = text()();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class MomentsLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final journalLocalId = integer().references(JournalsLocal, #localId)();
  late final locationLocalId = integer().references(LocationsLocal, #localId)();

  late final name = text()();
  late final description = text().nullable()();

  late final categoryLocalId =
      integer().references(CategoriesLocal, #localId)();

  late final timestamp = dateTime()();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class MomentMediaLocal extends Table {
  late final localId = integer().autoIncrement()();
  late final serverId = text().nullable()();

  late final momentLocalId = integer().references(MomentsLocal, #localId)();

  late final mediaUrl = text()();
  late final mediaType = text().nullable()();

  late final localFilePath = text().nullable()();

  late final updatedAt = dateTime()();
  late final syncStatus =
      text().withDefault(const Constant(SyncStatus.pendingAdd))();
}

class SyncHistory extends Table {
  late final localId = integer().autoIncrement()();
  late final syncStatus = text()();
  late final syncType = text().nullable()();
  late final syncTime = dateTime()();
  late final syncMessage = text().nullable()();
}

@DriftDatabase(
  tables: [
    ContinentsLocal,
    CountriesLocal,
    LocationsLocal,
    UsersLocal,
    UserProfilesLocal,
    UserVisitedCountriesLocal,
    JournalsLocal,
    MomentsLocal,
    MomentMediaLocal,
    CategoriesLocal,
    SyncHistory,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {},
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, Constants.driftDatabaseName));
    return NativeDatabase(file);
  });
}
