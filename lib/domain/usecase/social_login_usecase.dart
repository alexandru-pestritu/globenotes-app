import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class GoogleLoginUseCase implements BaseUseCase<NoParams, Authentication> {
  final Repository _repository;

  GoogleLoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(NoParams input) async {
    return await _repository.loginWithGoogle();
  }
}

class FacebookLoginUseCase implements BaseUseCase<NoParams, Authentication> {
  final Repository _repository;

  FacebookLoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(NoParams input) async {
    return await _repository.loginWithFacebook();
  }
}
