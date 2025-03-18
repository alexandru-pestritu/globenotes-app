import 'package:dartz/dartz.dart';
import 'package:globenotes/data/data_source/local/category_local_data_source.dart';
import 'package:globenotes/data/data_source/remote/moment_remote_data_source.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/mapper/category_mapper.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/moment_repository.dart';

class MomentRepositoryImpl implements MomentRepository {
  final MomentRemoteDataSource _momentRemoteDataSource;
  final CategoriesLocalDataSource _categoriesLocalDataSource;
  final NetworkInfo _networkInfo;

  MomentRepositoryImpl(
    this._momentRemoteDataSource,
    this._categoriesLocalDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, bool>>
  fetchCategoriesFromServerAndSaveToLocal() async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final response = await _momentRemoteDataSource.getAllCategories();
      if (response.statusCode == ResponseCode.success) {
        final categoriesDTO = response.data?.categories ?? [];

        await _categoriesLocalDataSource.deleteAllCategories();

        for (final categoryDTO in categoriesDTO) {
          final companion = categoryDTO.toCompanion(
            syncStatus: SyncStatus.synced,
          );
          await _categoriesLocalDataSource.insertCategory(companion);
        }

        return const Right(true);
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
  }

  @override
  Future<Either<Failure, List<Category>>> getAllCategoriesLocal() async {
    try {
      final localCategories =
          await _categoriesLocalDataSource.getAllCategories();

      final domainCategories =
          localCategories.map((lc) => lc.toDomain()).toList();

      return Right(domainCategories);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
