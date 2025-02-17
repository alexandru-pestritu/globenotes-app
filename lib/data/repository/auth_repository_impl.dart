
import 'package:dartz/dartz.dart';
import 'package:globenotes/data/data_source/remote_data_source.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/data/request/auth_request.dart';
import 'package:globenotes/domain/model/authentication.dart';
import 'package:globenotes/domain/repository/auth_repository.dart';
import 'package:globenotes/data/mapper/authentication_mapper.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  AuthRepositoryImpl(this._remoteDataSource, this._networkInfo);
  
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.statusCode == ResponseCode.success)
        {
          return Right(response.toDomain());
        } else {

          return Left(Failure(response.statusCode ?? ResponseCode.defaultError,
              response.message ?? ResponseMessage.defaultError));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}