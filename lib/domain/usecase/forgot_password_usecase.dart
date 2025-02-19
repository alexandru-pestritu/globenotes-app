import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class ForgotPasswordUseCase implements BaseUseCase<ForgotPasswordUseCaseInput, bool> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(ForgotPasswordUseCaseInput input) async {
    return await _repository.forgotPassword(
      ForgotPasswordRequest(input.email),
    );
  }
}

class ForgotPasswordUseCaseInput {
  String email;

  ForgotPasswordUseCaseInput(this.email);
}