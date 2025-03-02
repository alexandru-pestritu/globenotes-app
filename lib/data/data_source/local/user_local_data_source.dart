import 'package:globenotes/data/database/app_database.dart';

class UsersLocalDataSource {
  final AppDatabase _db;

  UsersLocalDataSource(this._db);

  Future<int> insertUser(UsersLocalCompanion user) {
    return _db.into(_db.usersLocal).insert(user);
  }

  Future<List<UsersLocalData>> getAllUsers() {
    return _db.select(_db.usersLocal).get();
  }

  Future<UsersLocalData> getUser(int localId) {
    return (_db.select(_db.usersLocal)..where((tbl) => tbl.localId.equals(localId)))
        .getSingle();
  }

  Future<bool> updateUser(UsersLocalData user) {
    return _db.update(_db.usersLocal).replace(user);
  }

  Future<int> deleteUser(int localId) {
    return (_db.delete(_db.usersLocal)..where((tbl) => tbl.localId.equals(localId)))
        .go();
  }

  Future<int> deleteAllUsers() {
    return _db.delete(_db.usersLocal).go();
  }
}
