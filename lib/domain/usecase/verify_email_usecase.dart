import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class VerifyEmailUseCase implements BaseUseCase<VerifyEmailUseCaseInput, bool> {
  final Repository _repository;

  VerifyEmailUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(VerifyEmailUseCaseInput input) async {
    return await _repository.verifyEmail(
      VerifyEmailRequest(input.email, input.code),
    );
  }
}

class VerifyEmailUseCaseInput {
  String email;
  String code;

  VerifyEmailUseCaseInput(this.email, this.code);
}
