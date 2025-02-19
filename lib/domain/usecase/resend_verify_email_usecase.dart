import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class ResendVerifyEmailUseCase
    implements BaseUseCase<ResendVerifyEmailUseCaseInput, bool> {
  final Repository _repository;

  ResendVerifyEmailUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(
    ResendVerifyEmailUseCaseInput input,
  ) async {
    return await _repository.resendVerifyEmail(ResendVerifyEmailRequest(input.email));
  }
}

class ResendVerifyEmailUseCaseInput {
  String email;

  ResendVerifyEmailUseCaseInput(this.email);
}
