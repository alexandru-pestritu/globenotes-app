import 'package:globenotes/data/database/app_database.dart';

abstract class CategoriesLocalDataSource {
  Future<CategoriesLocalData> insertCategory(CategoriesLocalCompanion category);
  Future<List<CategoriesLocalData>> getAllCategories();
  Future<CategoriesLocalData> getCategory(int localId);
  Future<bool> updateCategory(CategoriesLocalData category);
  Future<int> deleteCategory(int localId);
  Future<int> deleteAllCategories();
}

class CategoriesLocalDataSourceImpl implements CategoriesLocalDataSource {
  final AppDatabase _db;

  CategoriesLocalDataSourceImpl(this._db);

  @override
  Future<CategoriesLocalData> insertCategory(CategoriesLocalCompanion category) async {
    if (category.serverId.present && category.serverId.value != null) {
      final existing = await (_db.select(_db.categoriesLocal)
            ..where((tbl) => tbl.serverId.equals(category.serverId.value!)))
          .getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final categoryId = await _db.into(_db.categoriesLocal).insert(category);
    return await (_db.select(_db.categoriesLocal)
          ..where((tbl) => tbl.localId.equals(categoryId)))
        .getSingle();
  }

  @override
  Future<List<CategoriesLocalData>> getAllCategories() {
    return _db.select(_db.categoriesLocal).get();
  }

  @override
  Future<CategoriesLocalData> getCategory(int localId) {
    return (_db.select(_db.categoriesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateCategory(CategoriesLocalData category) {
    return _db.update(_db.categoriesLocal).replace(category);
  }

  @override
  Future<int> deleteCategory(int localId) {
    return (_db.delete(_db.categoriesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllCategories() {
    return _db.delete(_db.categoriesLocal).go();
  }
}
