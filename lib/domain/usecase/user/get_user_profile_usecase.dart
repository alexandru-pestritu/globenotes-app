import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/user_repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class GetUserProfileUseCase extends BaseUseCase<void, UserProfile> {
  final UserRepository _userRepository;

  GetUserProfileUseCase(this._userRepository);

  @override
  Future<Either<Failure, UserProfile>> execute(void request) {
    return _userRepository.getUserProfileLocal();
  }
}
