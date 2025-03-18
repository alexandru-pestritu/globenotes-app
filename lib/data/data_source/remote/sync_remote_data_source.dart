import 'package:globenotes/data/dto/sync/sync_dtos.dart';
import 'package:globenotes/data/network/app_api.dart';

abstract class SyncRemoteDataSource {
  Future<SyncDataResponse> sync(String lastSync);
}

class SyncRemoteDataSourceImpl implements SyncRemoteDataSource {
  final AppServiceClient _appServiceClient;

  SyncRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<SyncDataResponse> sync(String lastSync) {
    return _appServiceClient.sync(lastSync);
  }
}
