import 'package:globenotes/data/network/app_api.dart';
import 'package:globenotes/data/dto/s3/s3_dtos.dart';

abstract class S3RemoteDataSource {
  Future<PutPresignedUrlResponse> getPresignedUrls(
    List<PresignedUploadRequestDTO> request,
  );

  Future<GetPresignedUrlResponse> getPresignedUrlsForDownload(
    GetKeysRequest request,
  );
}

class S3RemoteDataSourceImpl implements S3RemoteDataSource {
  final AppServiceClient _appServiceClient;

  S3RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<PutPresignedUrlResponse> getPresignedUrls(
    List<PresignedUploadRequestDTO> request,
  ) {
    return _appServiceClient.getPresignedUrls(request);
  }

  @override
  Future<GetPresignedUrlResponse> getPresignedUrlsForDownload(
    GetKeysRequest request,
  ) {
    return _appServiceClient.getPresignedUrlsForDownload(request);
  }
}
