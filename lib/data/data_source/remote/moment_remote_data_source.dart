import 'package:globenotes/data/dto/category/category_dtos.dart';
import 'package:globenotes/data/network/app_api.dart';
import 'package:globenotes/data/dto/moment/moment_dtos.dart';
import 'package:globenotes/data/dto/response/base_response.dart';

abstract class MomentRemoteDataSource {
  Future<CreateOrUpdateMomentResponse> createMoment(MomentDetailsDTO request);
  Future<CreateOrUpdateMomentResponse> updateMoment(MomentDetailsDTO request);
  Future<CreateOrUpdateMomentResponse> getMoment(int momentId);
  Future<BaseResponse> deleteMoment(int momentId);
  Future<GetMomentsByJournalResponse> getMomentsByJournal(int journalId);
  Future<GetMomentCategoriesResponse> getAllCategories();
}

class MomentRemoteDataSourceImpl implements MomentRemoteDataSource {
  final AppServiceClient _appServiceClient;

  MomentRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<CreateOrUpdateMomentResponse> createMoment(MomentDetailsDTO request) {
    return _appServiceClient.createMoment(request);
  }

  @override
  Future<CreateOrUpdateMomentResponse> updateMoment(MomentDetailsDTO request) {
    return _appServiceClient.updateMoment(request);
  }

  @override
  Future<CreateOrUpdateMomentResponse> getMoment(int momentId) {
    return _appServiceClient.getMoment(momentId);
  }

  @override
  Future<BaseResponse> deleteMoment(int momentId) {
    return _appServiceClient.deleteMoment(momentId);
  }

  @override
  Future<GetMomentsByJournalResponse> getMomentsByJournal(int journalId) {
    return _appServiceClient.getMomentsByJournal(journalId);
  }

  @override
  Future<GetMomentCategoriesResponse> getAllCategories() {
    return _appServiceClient.getAllCategories();
  }
}
