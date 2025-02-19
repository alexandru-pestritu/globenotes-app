import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class VerifyForgotPasswordUseCase
    implements BaseUseCase<VerifyForgotPasswordUseCaseUseCaseInput, bool> {
  final Repository _repository;

  VerifyForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(
    VerifyForgotPasswordUseCaseUseCaseInput input,
  ) async {
    return await _repository.verifyEmail(
      VerifyEmailRequest(input.email, input.code),
    );
  }
}

class VerifyForgotPasswordUseCaseUseCaseInput {
  String email;
  String code;

  VerifyForgotPasswordUseCaseUseCaseInput(this.email, this.code);
}
