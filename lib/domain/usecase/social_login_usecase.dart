import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class GoogleLoginUseCase
    implements BaseUseCase<GoogleLoginUseCaseInput, Authentication> {
  final Repository _repository;

  GoogleLoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    GoogleLoginUseCaseInput input,
  ) async {
    return await _repository.loginWithGoogle(SocialLoginRequest(input.idToken));
  }
}

class GoogleLoginUseCaseInput {
  String idToken;

  GoogleLoginUseCaseInput(this.idToken);
}

class FacebookLoginUseCase
    implements BaseUseCase<FacebookLoginUseCaseInput, Authentication> {
  final Repository _repository;

  FacebookLoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    FacebookLoginUseCaseInput input,
  ) async {
    return await _repository.loginWithFacebook(
      SocialLoginRequest(input.idToken),
    );
  }
}

class FacebookLoginUseCaseInput {
  String idToken;

  FacebookLoginUseCaseInput(this.idToken);
}
