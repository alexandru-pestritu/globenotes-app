import 'package:dartz/dartz.dart';
import 'package:globenotes/data/data_source/local/user_local_data_source.dart';
import 'package:globenotes/data/data_source/remote/auth_remote_data_source.dart';
import 'package:globenotes/data/data_source/local/secure_storage_local_data_source.dart';
import 'package:globenotes/data/data_source/local/social_auth_local_data_source.dart';
import 'package:globenotes/data/mapper/user_mapper.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/data/dto/request/requests.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/auth_repository.dart';
import 'package:globenotes/data/mapper/auth_mapper.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SocialAuthLocalDataSource _socialAuthLocalDataSource;
  final SecureStorageLocalDataSource _secureStorageLocalDataSource;
  final UsersLocalDataSource _usersLocalDataSource;
  final NetworkInfo _networkInfo;
  AuthRepositoryImpl(
    this._remoteDataSource,
    this._socialAuthLocalDataSource,
    this._secureStorageLocalDataSource,
    this._usersLocalDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.statusCode == ResponseCode.success) {
          final auth = response.toDomain();
          await _secureStorageLocalDataSource.saveAuthTokens(
            auth.accessToken,
            auth.refreshToken,
          );

          final userDTO = response.data?.user;
          if (userDTO != null) {
            final userCompanion = userDTO.toCompanion();
            await _usersLocalDataSource.insertUser(userCompanion);
          }
          return Right(auth);
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

  @override
  Future<Either<Failure, bool>> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.forgotPassword(
          forgotPasswordRequest,
        );

        if (response.statusCode == ResponseCode.success) {
          return Right(true);
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

  @override
  Future<Either<Failure, bool>> register(
    RegisterRequest registerRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.register(registerRequest);

        if (response.statusCode == ResponseCode.success) {
          return Right(true);
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

  @override
  Future<Either<Failure, bool>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.resetPassword(
          resetPasswordRequest,
        );

        if (response.statusCode == ResponseCode.success) {
          return Right(true);
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

  @override
  Future<Either<Failure, bool>> verifyEmail(
    VerifyEmailRequest verifyEmailRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.verifyEmail(
          verifyEmailRequest,
        );

        if (response.statusCode == ResponseCode.success) {
          return Right(true);
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

  @override
  Future<Either<Failure, bool>> resendVerifyEmail(
    ResendVerifyEmailRequest resendVerifyEmailRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.resendVerifyEmail(
          resendVerifyEmailRequest,
        );

        if (response.statusCode == ResponseCode.success) {
          return Right(true);
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

  @override
  Future<Either<Failure, bool>> verifyForgotPassword(
    VerifyForgotPasswordRequest verifyForgotPasswordRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.verifyForgotPassword(
          verifyForgotPasswordRequest,
        );

        if (response.statusCode == ResponseCode.success) {
          return Right(true);
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

  @override
  Future<Either<Failure, Authentication>> loginWithGoogle() async {
    if (await _networkInfo.isConnected) {
      try {
        final String? idToken =
            await _socialAuthLocalDataSource.signInWithGoogle();

        if (idToken == null) {
          return Left(Failure(ResponseCode.cancel, ResponseMessage.cancel));
        }

        final response = await _remoteDataSource.loginWithGoogle(
          SocialLoginRequest(idToken),
        );

        if (response.statusCode == ResponseCode.success) {
          final auth = response.toDomain();
          await _secureStorageLocalDataSource.saveAuthTokens(
            auth.accessToken,
            auth.refreshToken,
          );

          final userDTO = response.data?.user;
          if (userDTO != null) {
            final userCompanion = userDTO.toCompanion();
            await _usersLocalDataSource.insertUser(userCompanion);
          }
          return Right(auth);
        } else {
          return Left(
            Failure(
              response.statusCode ?? ResponseCode.defaultError,
              response.message ?? ResponseMessage.defaultError,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> loginWithFacebook() async {
    if (await _networkInfo.isConnected) {
      try {
        final String? token =
            await _socialAuthLocalDataSource.signInWithFacebook();

        if (token == null) {
          return Left(Failure(ResponseCode.cancel, ResponseMessage.cancel));
        }

        final response = await _remoteDataSource.loginWithFacebook(
          SocialLoginRequest(token),
        );

        if (response.statusCode == ResponseCode.success) {
          final auth = response.toDomain();
          await _secureStorageLocalDataSource.saveAuthTokens(
            auth.accessToken,
            auth.refreshToken,
          );
          final userDTO = response.data?.user;
          if (userDTO != null) {
            final userCompanion = userDTO.toCompanion();
            await _usersLocalDataSource.insertUser(userCompanion);
          }
          return Right(auth);
        } else {
          return Left(
            Failure(
              response.statusCode ?? ResponseCode.defaultError,
              response.message ?? ResponseMessage.defaultError,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
