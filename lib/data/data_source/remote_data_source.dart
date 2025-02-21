import 'package:globenotes/data/network/app_api.dart';
import 'package:globenotes/data/request/requests.dart';
import 'package:globenotes/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<LoginResponse> loginWithGoogle(SocialLoginRequest socialLoginRequest);
  Future<LoginResponse> loginWithFacebook(
    SocialLoginRequest socialLoginRequest,
  );
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<VerifyEmailResponse> verifyEmail(
    VerifyEmailRequest verifyEmailRequest,
  );
  Future<ResendVerifyEmailResponse> resendVerifyEmail(
    ResendVerifyEmailRequest resendVerifyEmailRequest,
  );
  Future<ForgotPasswordResponse> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  );
  Future<VerifyForgotPasswordResponse> verifyForgotPassword(
    VerifyForgotPasswordRequest verifyForgotPasswordRequest,
  );
  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }

  @override
  Future<LoginResponse> loginWithGoogle(
    SocialLoginRequest socialLoginRequest,
  ) async {
    return await _appServiceClient.loginWithGoogle(
      socialLoginRequest.idToken,
    );
  }

  @override
  Future<LoginResponse> loginWithFacebook(
    SocialLoginRequest socialLoginRequest,
  ) async {
    return await _appServiceClient.loginWithFacebook(
      socialLoginRequest.idToken,
    );
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
      registerRequest.name,
      registerRequest.email,
      registerRequest.password,
    );
  }

  @override
  Future<VerifyEmailResponse> verifyEmail(
    VerifyEmailRequest verifyEmailRequest,
  ) async {
    return await _appServiceClient.verifyEmail(
      verifyEmailRequest.email,
      verifyEmailRequest.code,
    );
  }

  @override
  Future<ResendVerifyEmailResponse> resendVerifyEmail(
    ResendVerifyEmailRequest resendVerifyEmailRequest,
  ) async {
    return await _appServiceClient.resendVerifyEmail(
      resendVerifyEmailRequest.email,
    );
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    return await _appServiceClient.forgotPassword(forgotPasswordRequest.email);
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return await _appServiceClient.resetPassword(
      resetPasswordRequest.email,
      resetPasswordRequest.code,
      resetPasswordRequest.password,
    );
  }

  @override
  Future<VerifyForgotPasswordResponse> verifyForgotPassword(
    VerifyForgotPasswordRequest verifyForgotPasswordRequest,
  ) async {
    return await _appServiceClient.verifyForgotPassword(
      verifyForgotPasswordRequest.email,
      verifyForgotPasswordRequest.code,
    );
  }
}
