import 'package:dartz/dartz.dart';
import 'package:globenotes/data/data_source/remote_data_source.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/data/mapper/mapper.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.statusCode == ResponseCode.success) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.statusCode ?? ResponseCode.defaultError,
              response.message ?? ResponseMessage.defaultError,
            ),
          );
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
