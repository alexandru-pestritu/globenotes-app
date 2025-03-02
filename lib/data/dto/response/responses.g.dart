// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
  accessToken: json['access_token'] as String?,
  refreshToken: json['refresh_token'] as String?,
  user:
      json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'user': instance.user,
};

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      timeStamp: json['timeStamp'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : AuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'timeStamp': instance.timeStamp,
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      timeStamp: json['timeStamp'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'timeStamp': instance.timeStamp,
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
    };

VerifyEmailResponse _$VerifyEmailResponseFromJson(Map<String, dynamic> json) =>
    VerifyEmailResponse(
      timeStamp: json['timeStamp'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$VerifyEmailResponseToJson(
  VerifyEmailResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
};

ResendVerifyEmailResponse _$ResendVerifyEmailResponseFromJson(
  Map<String, dynamic> json,
) => ResendVerifyEmailResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$ResendVerifyEmailResponseToJson(
  ResendVerifyEmailResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
};

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$ForgotPasswordResponseToJson(
  ForgotPasswordResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
};

VerifyForgotPasswordResponse _$VerifyForgotPasswordResponseFromJson(
  Map<String, dynamic> json,
) => VerifyForgotPasswordResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$VerifyForgotPasswordResponseToJson(
  VerifyForgotPasswordResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
};

ResetPasswordResponse _$ResetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$ResetPasswordResponseToJson(
  ResetPasswordResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
};

RefreshTokenResponse _$RefreshTokenResponseFromJson(
  Map<String, dynamic> json,
) => RefreshTokenResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : AuthData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RefreshTokenResponseToJson(
  RefreshTokenResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
