import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class VerifyForgotPasswordUseCase
    implements BaseUseCase<VerifyForgotPasswordUseCaseInput, bool> {
  final Repository _repository;

  VerifyForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(
    VerifyForgotPasswordUseCaseInput input,
  ) async {
    return await _repository.verifyForgotPassword(
      VerifyForgotPasswordRequest(input.email, input.code),
    );
  }
}

class VerifyForgotPasswordUseCaseInput {
  String email;
  String code;

  VerifyForgotPasswordUseCaseInput(this.email, this.code);
}
