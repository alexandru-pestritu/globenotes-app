// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String email, String password) = _LoginObject;
}

@freezed
class SocialLoginObject with _$SocialLoginObject {
  factory SocialLoginObject(String idToken) = _SocialLoginObject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(String name, String email, String password) =
      _RegisterObject;
}

@freezed
class VerifyEmailObject with _$VerifyEmailObject {
  factory VerifyEmailObject(String email, String code) = _VerifyEmailObject;
}

@freezed
class ResendVerificationObject with _$ResendVerificationObject {
  factory ResendVerificationObject(String email) = _ResendVerificationObject;
}

@freezed
class ForgotPasswordObject with _$ForgotPasswordObject {
  factory ForgotPasswordObject(String email) = _ForgotPasswordObject;
}

@freezed
class VerifyForgotPasswordObject with _$VerifyForgotPasswordObject {
  factory VerifyForgotPasswordObject(String email, String code) =
      _VerifyForgotPasswordObject;
}

@freezed
class ResetPasswordObject with _$ResetPasswordObject {
  factory ResetPasswordObject(
    String email,
    String code,
    String password,
    String confirmPassword,
  ) = _ResetPasswordObject;
}
