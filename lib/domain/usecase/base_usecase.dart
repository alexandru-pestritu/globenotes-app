import 'package:globenotes/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

class NoParams {
  const NoParams();
}

abstract class BaseUseCaseWithProgress<In, ProgressData> {
  Stream<Either<Failure, ProgressData>> execute(In input);
}
