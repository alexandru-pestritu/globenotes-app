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
