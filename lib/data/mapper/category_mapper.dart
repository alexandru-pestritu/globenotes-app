import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/category/category_dtos.dart';
import 'package:globenotes/domain/model/model.dart';

extension CategoryDTOToCompanion on CategoryDTO {
  CategoriesLocalCompanion toCompanion({
    String syncStatus = SyncStatus.synced,
  }) {
    return CategoriesLocalCompanion(
      serverId: Value(id?.toString()),
      name: Value(name ?? ''),
      syncStatus: Value(syncStatus),
    );
  }
}

extension CategoryLocalDataToDomain on CategoriesLocalData {
  Category toDomain() {
    return Category(serverId: serverId ?? '', localId: localId, name: name);
  }
}

extension CategoryLocalDataToDTO on Category {
  CategoryDTO toDTO() {
    return CategoryDTO(
      id: int.tryParse(serverId ?? ''),
      name: name,
    );
  }
}
