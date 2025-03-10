// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalDTO _$JournalDTOFromJson(Map<String, dynamic> json) => JournalDTO(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  name: json['name'] as String?,
  shortSummary: json['shortSummary'] as String?,
  tripLocation:
      json['tripLocation'] == null
          ? null
          : LocationDetailsDTO.fromJson(
            json['tripLocation'] as Map<String, dynamic>,
          ),
  coverPhotoUrl: json['coverPhotoUrl'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  remindersEnabled: json['remindersEnabled'] as bool?,
  updatedAt: json['updatedAt'] as String?,
  isDeleted: json['isDeleted'] as bool?,
);

Map<String, dynamic> _$JournalDTOToJson(JournalDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'shortSummary': instance.shortSummary,
      'tripLocation': instance.tripLocation,
      'coverPhotoUrl': instance.coverPhotoUrl,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'remindersEnabled': instance.remindersEnabled,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
    };

JournalDetailsDTO _$JournalDetailsDTOFromJson(Map<String, dynamic> json) =>
    JournalDetailsDTO(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      name: json['name'] as String?,
      shortSummary: json['shortSummary'] as String?,
      tripLocation:
          json['tripLocation'] == null
              ? null
              : LocationDetailsDTO.fromJson(
                json['tripLocation'] as Map<String, dynamic>,
              ),
      coverPhotoUrl: json['coverPhotoUrl'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      remindersEnabled: json['remindersEnabled'] as bool?,
      updatedAt: json['updatedAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      moments:
          (json['moments'] as List<dynamic>?)
              ?.map((e) => MomentDetailsDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$JournalDetailsDTOToJson(JournalDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'shortSummary': instance.shortSummary,
      'tripLocation': instance.tripLocation,
      'coverPhotoUrl': instance.coverPhotoUrl,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'remindersEnabled': instance.remindersEnabled,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
      'moments': instance.moments,
    };
