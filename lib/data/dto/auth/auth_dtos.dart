import 'package:globenotes/data/dto/response/base_response.dart';
import 'package:globenotes/data/dto/user/user_dtos.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_dtos.g.dart';

@JsonSerializable()
class AuthData {
  @JsonKey(name: "access_token")
  String? accessToken;

  @JsonKey(name: "refresh_token")
  String? refreshToken;

  @JsonKey(name: "user")
  UserDTO? user;

  AuthData({this.accessToken, this.refreshToken, this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: "data")
  AuthData? data;

  LoginResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class RegisterResponse extends BaseResponse {
  RegisterResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class VerifyEmailResponse extends BaseResponse {
  VerifyEmailResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
  });

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerifyEmailResponseToJson(this);
}

@JsonSerializable()
class ResendVerifyEmailResponse extends BaseResponse {
  ResendVerifyEmailResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
  });

  factory ResendVerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendVerifyEmailResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResendVerifyEmailResponseToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  ForgotPasswordResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}

@JsonSerializable()
class VerifyForgotPasswordResponse extends BaseResponse {
  VerifyForgotPasswordResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
  });

  factory VerifyForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyForgotPasswordResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerifyForgotPasswordResponseToJson(this);
}

@JsonSerializable()
class ResetPasswordResponse extends BaseResponse {
  ResetPasswordResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}

@JsonSerializable()
class RefreshTokenResponse extends BaseResponse {
  @JsonKey(name: "data")
  AuthData? data;

  RefreshTokenResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}