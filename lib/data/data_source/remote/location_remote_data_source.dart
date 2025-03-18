import 'package:globenotes/data/network/app_api.dart';
import 'package:globenotes/data/dto/continent/continent_dtos.dart';

abstract class LocationRemoteDataSource {
  Future<GetAllContinentsWithCountriesResponse> getAllContinentsWithCountries();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final AppServiceClient _appServiceClient;

  LocationRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<GetAllContinentsWithCountriesResponse>
  getAllContinentsWithCountries() {
    return _appServiceClient.getAllContinentsWithCountries();
  }
}
