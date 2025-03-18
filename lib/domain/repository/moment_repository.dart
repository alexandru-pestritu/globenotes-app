import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';

abstract class MomentRepository {
  Future<Either<Failure, bool>> fetchCategoriesFromServerAndSaveToLocal();

  Future<Either<Failure, List<Category>>> getAllCategoriesLocal();
}
