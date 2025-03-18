import 'package:globenotes/data/dto/response/base_response.dart';
import 'package:globenotes/data/dto/user/user_dtos.dart';
import 'package:globenotes/data/network/app_api.dart';
import 'package:globenotes/data/dto/user_profile/user_profile_dtos.dart';
import 'package:globenotes/data/dto/user_visited_country/user_visited_country_dtos.dart';

abstract class UserRemoteDataSource {
  Future<GetOrUpdateProfileResponse> getUserProfile();
  Future<GetOrUpdateProfileResponse> updateUserProfile(
    UserProfileDetailsDTO request,
  );

  Future<GetUserResponse> getUser();
  Future<BaseResponse> deleteUser();

  Future<BaseResponse> updatePassword(UpdatePasswordRequest request);
  Future<BaseResponse> updateEmail(UpdateEmailRequest request);

  Future<AddVisitedCountryResponse> addUserVisitedCountry(
    UserVisitedCountryDTO request,
  );
  Future<GetVisitedCountriesResponse> getVisitedCountries();
  Future<BaseResponse> deleteUserVisitedCountry(int userVisitedCountryId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final AppServiceClient _appServiceClient;

  UserRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<GetOrUpdateProfileResponse> getUserProfile() {
    return _appServiceClient.getUserProfile();
  }

  @override
  Future<GetOrUpdateProfileResponse> updateUserProfile(
    UserProfileDetailsDTO request,
  ) {
    return _appServiceClient.updateUserProfile(request);
  }

  @override
  Future<GetUserResponse> getUser() {
    return _appServiceClient.getUser();
  }

  @override
  Future<BaseResponse> deleteUser() {
    return _appServiceClient.deleteUser();
  }

  @override
  Future<BaseResponse> updatePassword(UpdatePasswordRequest request) {
    return _appServiceClient.updatePassword(request);
  }

  @override
  Future<BaseResponse> updateEmail(UpdateEmailRequest request) {
    return _appServiceClient.updateEmail(request);
  }

  @override
  Future<AddVisitedCountryResponse> addUserVisitedCountry(
    UserVisitedCountryDTO request,
  ) {
    return _appServiceClient.addUserVisitedCountry(request);
  }

  @override
  Future<GetVisitedCountriesResponse> getVisitedCountries() {
    return _appServiceClient.getVisitedCountries();
  }

  @override
  Future<BaseResponse> deleteUserVisitedCountry(int userVisitedCountryId) {
    return _appServiceClient.deleteUserVisitedCountry(userVisitedCountryId);
  }
}
