import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/repository/s3_repository.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class S3FileManager {
  final S3Repository _s3Repository;

  S3FileManager(this._s3Repository);

  Future<Either<Failure, String>> downloadFileFromS3({
    required String s3Key,
    String subFolder = 'images',
  }) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final subdir = Directory(p.join(directory.path, subFolder));
      if (!subdir.existsSync()) {
        subdir.createSync(recursive: true);
      }
      final localPath = p.join(subdir.path, p.basename(s3Key));

      final result = await _s3Repository.downloadFile(
        s3Key: s3Key,
        localSavePath: localPath,
      );
      return result.fold(
        (failure) => Left(failure),
        (success) => Right(localPath),
      );
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<Either<Failure, String>> copyFileToAppStorage({
    required String sourcePath,
    String subFolder = 'images',
  }) async {
    try {
      final sourceFile = File(sourcePath);
      if (!sourceFile.existsSync()) {
        return Left(Failure(ResponseCode.defaultError, ResponseMessage.defaultError));
      }
      final docDir = await getApplicationDocumentsDirectory();
      final folder = Directory(p.join(docDir.path, subFolder));
      if (!folder.existsSync()) {
        folder.createSync(recursive: true);
      }
      final fileName = p.basename(sourcePath);
      final destPath = p.join(folder.path, fileName);

      final destFile = await sourceFile.copy(destPath);
      return Right(destFile.path);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<Either<Failure, String>> uploadFileToS3({
    required String localFilePath,
    String? fileName,
  }) async {
    return _s3Repository.uploadFile(
      localFilePath: localFilePath,
      fileName: fileName,
    );
  }
}