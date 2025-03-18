// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  isVerified: json['verified'] as bool?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'verified': instance.isVerified,
  'updatedAt': instance.updatedAt,
};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  user:
      json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'user': instance.user,
};

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) =>
    GetUserResponse(
      timeStamp: json['timeStamp'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserResponseToJson(GetUserResponse instance) =>
    <String, dynamic>{
      'timeStamp': instance.timeStamp,
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UpdatePasswordRequest _$UpdatePasswordRequestFromJson(
  Map<String, dynamic> json,
) => UpdatePasswordRequest(password: json['password'] as String);

Map<String, dynamic> _$UpdatePasswordRequestToJson(
  UpdatePasswordRequest instance,
) => <String, dynamic>{'password': instance.password};

UpdateEmailRequest _$UpdateEmailRequestFromJson(Map<String, dynamic> json) =>
    UpdateEmailRequest(email: json['email'] as String);

Map<String, dynamic> _$UpdateEmailRequestToJson(UpdateEmailRequest instance) =>
    <String, dynamic>{'email': instance.email};
