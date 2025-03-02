import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/dto/request/requests.dart';
import 'package:globenotes/domain/model/model.dart';

abstract class AuthRepository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Authentication>> loginWithGoogle();
  Future<Either<Failure, Authentication>> loginWithFacebook();
  Future<Either<Failure, bool>> register(RegisterRequest registerRequest);
  Future<Either<Failure, bool>> verifyEmail(
    VerifyEmailRequest verifyEmailRequest,
  );
  Future<Either<Failure, bool>> resendVerifyEmail(
    ResendVerifyEmailRequest resendVerifyEmailRequest,
  );
  Future<Either<Failure, bool>> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  );
  Future<Either<Failure, bool>> verifyForgotPassword(
    VerifyForgotPasswordRequest verifyForgotPasswordRequest,
  );
  Future<Either<Failure, bool>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );
}
