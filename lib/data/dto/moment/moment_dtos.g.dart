// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentDTO _$MomentDTOFromJson(Map<String, dynamic> json) => MomentDTO(
  id: (json['id'] as num?)?.toInt(),
  journalId: (json['journalId'] as num?)?.toInt(),
  locationId: (json['locationId'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  categoryId: (json['categoryId'] as num?)?.toInt(),
  dateTime: json['dateTime'] as String?,
  updatedAt: json['updatedAt'] as String?,
  isDeleted: json['isDeleted'] as bool?,
);

Map<String, dynamic> _$MomentDTOToJson(MomentDTO instance) => <String, dynamic>{
  'id': instance.id,
  'journalId': instance.journalId,
  'locationId': instance.locationId,
  'name': instance.name,
  'description': instance.description,
  'categoryId': instance.categoryId,
  'dateTime': instance.dateTime,
  'updatedAt': instance.updatedAt,
  'isDeleted': instance.isDeleted,
};

MomentDetailsDTO _$MomentDetailsDTOFromJson(Map<String, dynamic> json) =>
    MomentDetailsDTO(
      id: (json['id'] as num?)?.toInt(),
      journalId: (json['journalId'] as num?)?.toInt(),
      location:
          json['location'] == null
              ? null
              : LocationDetailsDTO.fromJson(
                json['location'] as Map<String, dynamic>,
              ),
      name: json['name'] as String?,
      description: json['description'] as String?,
      category:
          json['category'] == null
              ? null
              : CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
      dateTime: json['dateTime'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      momentMediaList:
          (json['momentMediaList'] as List<dynamic>?)
              ?.map((e) => MomentMediaDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MomentDetailsDTOToJson(MomentDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'journalId': instance.journalId,
      'location': instance.location,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'dateTime': instance.dateTime,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
      'momentMediaList': instance.momentMediaList,
    };
