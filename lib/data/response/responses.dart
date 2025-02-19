import 'package:globenotes/data/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class LoginData {
  @JsonKey(name: "access_token")
  String? accessToken;

  @JsonKey(name: "refresh_token")
  String? refreshToken;

  LoginData({this.accessToken, this.refreshToken});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: "data")
  LoginData? data;

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
