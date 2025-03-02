import 'package:globenotes/data/database/app_database.dart';

abstract class UsersLocalDataSource {
  Future<int> insertUser(UsersLocalCompanion user);
  Future<List<UsersLocalData>> getAllUsers();
  Future<UsersLocalData> getUser(int localId);
  Future<bool> updateUser(UsersLocalData user);
  Future<int> deleteUser(int localId);
  Future<int> deleteAllUsers();
}

class UsersLocalDataSourceImpl implements UsersLocalDataSource {
  final AppDatabase _db;

  UsersLocalDataSourceImpl(this._db);

  @override
  Future<int> insertUser(UsersLocalCompanion user) {
    return _db.into(_db.usersLocal).insert(user);
  }

  @override
  Future<List<UsersLocalData>> getAllUsers() {
    return _db.select(_db.usersLocal).get();
  }

  @override
  Future<UsersLocalData> getUser(int localId) {
    return (_db.select(_db.usersLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateUser(UsersLocalData user) {
    return _db.update(_db.usersLocal).replace(user);
  }

  @override
  Future<int> deleteUser(int localId) {
    return (_db.delete(_db.usersLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllUsers() {
    return _db.delete(_db.usersLocal).go();
  }
}
