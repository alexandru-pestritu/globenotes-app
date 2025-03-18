// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncDataDTO _$SyncDataDTOFromJson(Map<String, dynamic> json) => SyncDataDTO(
  user:
      json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
  userProfile:
      json['userProfile'] == null
          ? null
          : UserProfileDetailsDTO.fromJson(
            json['userProfile'] as Map<String, dynamic>,
          ),
  userVisitedCountries:
      (json['userVisitedCountries'] as List<dynamic>?)
          ?.map(
            (e) => UserVisitedCountryDetailsDTO.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
  journals:
      (json['journals'] as List<dynamic>?)
          ?.map((e) => JournalDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
  moments:
      (json['moments'] as List<dynamic>?)
          ?.map((e) => MomentDetailsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SyncDataDTOToJson(SyncDataDTO instance) =>
    <String, dynamic>{
      'user': instance.user,
      'userProfile': instance.userProfile,
      'userVisitedCountries': instance.userVisitedCountries,
      'journals': instance.journals,
      'moments': instance.moments,
    };

SyncWrapperData _$SyncWrapperDataFromJson(Map<String, dynamic> json) =>
    SyncWrapperData(
      sync:
          json['sync'] == null
              ? null
              : SyncDataDTO.fromJson(json['sync'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SyncWrapperDataToJson(SyncWrapperData instance) =>
    <String, dynamic>{'sync': instance.sync};

SyncDataResponse _$SyncDataResponseFromJson(Map<String, dynamic> json) =>
    SyncDataResponse(
      timeStamp: json['timeStamp'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : SyncWrapperData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SyncDataResponseToJson(SyncDataResponse instance) =>
    <String, dynamic>{
      'timeStamp': instance.timeStamp,
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
