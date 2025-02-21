import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/domain/model/model.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Authentication>> loginWithGoogle(
    SocialLoginRequest socialLoginRequest,
  );
  Future<Either<Failure, Authentication>> loginWithFacebook(
    SocialLoginRequest socialLoginRequest,
  );
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
