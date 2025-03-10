// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_media_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentMediaDTO _$MomentMediaDTOFromJson(Map<String, dynamic> json) =>
    MomentMediaDTO(
      id: (json['id'] as num?)?.toInt(),
      momentId: (json['momentId'] as num?)?.toInt(),
      mediaUrl: json['mediaUrl'] as String?,
      mediaType: json['mediaType'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$MomentMediaDTOToJson(MomentMediaDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'momentId': instance.momentId,
      'mediaUrl': instance.mediaUrl,
      'mediaType': instance.mediaType,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
    };
