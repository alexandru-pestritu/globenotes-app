import 'package:globenotes/data/network/app_api.dart';
import 'package:globenotes/data/dto/journal/journal_dtos.dart';
import 'package:globenotes/data/dto/response/base_response.dart';

abstract class JournalRemoteDataSource {
  Future<GetJournalsResponse> getJournals();
  Future<CreateOrUpdateJournalResponse> createJournal(JournalDTO request);
  Future<CreateOrUpdateJournalResponse> updateJournal(JournalDTO request);
  Future<CreateOrUpdateJournalResponse> getJournalDetails(int journalId);
  Future<BaseResponse> deleteJournal(int journalId);
}

class JournalRemoteDataSourceImpl implements JournalRemoteDataSource {
  final AppServiceClient _appServiceClient;

  JournalRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<GetJournalsResponse> getJournals() {
    return _appServiceClient.getJournals();
  }

  @override
  Future<CreateOrUpdateJournalResponse> createJournal(JournalDTO request) {
    return _appServiceClient.createJournal(request);
  }

  @override
  Future<CreateOrUpdateJournalResponse> updateJournal(JournalDTO request) {
    return _appServiceClient.updateJournal(request);
  }

  @override
  Future<CreateOrUpdateJournalResponse> getJournalDetails(int journalId) {
    return _appServiceClient.getJournalDetails(journalId);
  }

  @override
  Future<BaseResponse> deleteJournal(int journalId) {
    return _appServiceClient.deleteJournal(journalId);
  }
}
