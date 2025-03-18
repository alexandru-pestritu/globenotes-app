// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDTO _$UserProfileDTOFromJson(Map<String, dynamic> json) =>
    UserProfileDTO(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      name: json['name'] as String?,
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
      coverPhotoUrl: json['coverPhotoUrl'] as String?,
      bio: json['bio'] as String?,
      locationId: (json['locationId'] as num?)?.toInt(),
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserProfileDTOToJson(UserProfileDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'coverPhotoUrl': instance.coverPhotoUrl,
      'bio': instance.bio,
      'locationId': instance.locationId,
      'updatedAt': instance.updatedAt,
    };

UserProfileDetailsDTO _$UserProfileDetailsDTOFromJson(
  Map<String, dynamic> json,
) => UserProfileDetailsDTO(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  profilePhotoUrl: json['profilePhotoUrl'] as String?,
  coverPhotoUrl: json['coverPhotoUrl'] as String?,
  bio: json['bio'] as String?,
  location:
      json['location'] == null
          ? null
          : LocationDetailsDTO.fromJson(
            json['location'] as Map<String, dynamic>,
          ),
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$UserProfileDetailsDTOToJson(
  UserProfileDetailsDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'profilePhotoUrl': instance.profilePhotoUrl,
  'coverPhotoUrl': instance.coverPhotoUrl,
  'bio': instance.bio,
  'location': instance.location,
  'updatedAt': instance.updatedAt,
};

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
  profile:
      json['profile'] == null
          ? null
          : UserProfileDetailsDTO.fromJson(
            json['profile'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{'profile': instance.profile};

GetOrUpdateProfileResponse _$GetOrUpdateProfileResponseFromJson(
  Map<String, dynamic> json,
) => GetOrUpdateProfileResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetOrUpdateProfileResponseToJson(
  GetOrUpdateProfileResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
