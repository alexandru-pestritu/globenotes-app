import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';

abstract class S3Repository {
  Future<Either<Failure, String>> uploadFile({
    required String localFilePath,
    String? fileName,
  });

  Future<Either<Failure, bool>> downloadFile({
    required String s3Key,
    required String localSavePath,
  });
}
