import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/repository/user_repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class LogoutUseCase extends BaseUseCase<void, bool> {
  final UserRepository _userRepository;

  LogoutUseCase(this._userRepository);

  @override
  Future<Either<Failure, bool>> execute(void request) {
    return _userRepository.logoutUser();
  }
}
