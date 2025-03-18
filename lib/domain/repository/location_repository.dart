import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';

abstract class LocationRepository {
  Future<Either<Failure, bool>> fetchContinentsAndCountriesFromServerAndSaveToLocal();
  Future<Either<Failure, List<Country>>> getAllCountriesWithContinentsLocal();
}
