import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> fetchUserProfileFromServerAndSaveToLocal();

  Future<Either<Failure, bool>> fetchUserVisitedCountriesFromServerAndSaveToLocal();

  Future<Either<Failure, UserProfile>> getUserProfileLocal();

  Future<Either<Failure, List<UserVisitedCountry>>> getUserVisitedCountriesLocal();

  Future<Either<Failure, bool>> logoutUser();
}
