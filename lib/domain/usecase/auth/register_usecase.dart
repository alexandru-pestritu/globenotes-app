import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/dto/request/requests.dart';
import 'package:globenotes/domain/repository/auth_repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, bool> {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(RegisterUseCaseInput input) async {
    return await _repository.register(
      RegisterRequest(input.name, input.email, input.password),
    );
  }
}

class RegisterUseCaseInput {
  String email;
  String password;
  String name;

  RegisterUseCaseInput(this.email, this.password, this.name);
}
