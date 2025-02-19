import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class ResetPasswordUseCase implements BaseUseCase<ResetPasswordUseCaseInput, bool> {
  final Repository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(ResetPasswordUseCaseInput input) async {
    return await _repository.resetPassword(
      ResetPasswordRequest(input.email, input.otp, input.password),
    );
  }
}

class ResetPasswordUseCaseInput {
  String email;
  String otp;
  String password;

  ResetPasswordUseCaseInput(this.email, this.otp, this.password);
}