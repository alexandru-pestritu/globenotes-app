import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:globenotes/data/data_source/remote/s3_remote_data_source.dart';
import 'package:globenotes/data/dto/s3/s3_dtos.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/domain/repository/s3_repository.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

class S3RepositoryImpl implements S3Repository {
  final S3RemoteDataSource _remoteDataSource;
  final Dio _dio;
  final NetworkInfo _networkInfo;

  S3RepositoryImpl(this._remoteDataSource, this._dio, this._networkInfo);

  @override
  Future<Either<Failure, String>> uploadFile({
    required String localFilePath,
    String? fileName,
  }) async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final contentType = guessContentType(localFilePath);

      final actualFileName = fileName ?? p.basename(localFilePath);
      final requestDto = PresignedUploadRequestDTO(
        fileName: actualFileName,
        contentType: contentType,
      );

      final putResponse = await _remoteDataSource.getPresignedUrls([
        requestDto,
      ]);
      if (putResponse.statusCode == ResponseCode.success) {
        final presignedList = putResponse.data?.presigned ?? [];
        if (presignedList.isEmpty) {
          return Left(
            Failure(ResponseCode.defaultError, ResponseMessage.defaultError),
          );
        }

        final presignedUrl = presignedList.first.presignedUrl;
        final s3Key = presignedList.first.key;

        final file = File(localFilePath);
        if (!file.existsSync()) {
          return Left(
            Failure(ResponseCode.defaultError, ResponseMessage.defaultError),
          );
        }

        final uploadResp = await _dio.put(
          presignedUrl,
          data: await MultipartFile.fromFile(
            localFilePath,
            filename: actualFileName,
          ),
          options: Options(contentType: contentType),
          onSendProgress: (sent, total) {},
        );

        if (uploadResp.statusCode == 200) {
          return Right(s3Key);
        } else {
          return Left(
            Failure(ResponseCode.defaultError, ResponseMessage.defaultError),
          );
        }
      } else {
        return Left(
          Failure(
            putResponse.statusCode ?? ResponseCode.defaultError,
            putResponse.message ?? ResponseMessage.defaultError,
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> downloadFile({
    required String s3Key,
    required String localSavePath,
  }) async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final getResp = await _remoteDataSource.getPresignedUrlsForDownload(
        GetKeysRequest(keys: [s3Key]),
      );

      if (getResp.statusCode == ResponseCode.success) {
        final list = getResp.data?.urls ?? [];
        if (list.isEmpty) {
          return Left(
            Failure(ResponseCode.defaultError, ResponseMessage.defaultError),
          );
        }
        final url = list.first.presignedUrl;

        final downloadResp = await _dio.download(
          url,
          localSavePath,
          onReceiveProgress: (received, total) {},
        );

        if (downloadResp.statusCode == 200) {
          return Right(true);
        } else {
          return Left(
            Failure(ResponseCode.defaultError, ResponseMessage.defaultError),
          );
        }
      } else {
        return Left(
          Failure(
            getResp.statusCode ?? ResponseCode.defaultError,
            getResp.message ?? ResponseMessage.defaultError,
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  String guessContentType(String filePath) {
    final mimeType = lookupMimeType(filePath);
    return mimeType ?? 'application/octet-stream';
  }
}
