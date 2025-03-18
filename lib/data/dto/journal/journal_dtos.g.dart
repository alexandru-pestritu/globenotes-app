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

JournalListData _$JournalListDataFromJson(Map<String, dynamic> json) =>
    JournalListData(
      journals:
          (json['journals'] as List<dynamic>?)
              ?.map((e) => JournalDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$JournalListDataToJson(JournalListData instance) =>
    <String, dynamic>{'journals': instance.journals};

GetJournalsResponse _$GetJournalsResponseFromJson(Map<String, dynamic> json) =>
    GetJournalsResponse(
      timeStamp: json['timeStamp'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : JournalListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetJournalsResponseToJson(
  GetJournalsResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

JournalData _$JournalDataFromJson(Map<String, dynamic> json) => JournalData(
  journal:
      json['journal'] == null
          ? null
          : JournalDetailsDTO.fromJson(json['journal'] as Map<String, dynamic>),
);

Map<String, dynamic> _$JournalDataToJson(JournalData instance) =>
    <String, dynamic>{'journal': instance.journal};

CreateOrUpdateJournalResponse _$CreateOrUpdateJournalResponseFromJson(
  Map<String, dynamic> json,
) => CreateOrUpdateJournalResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : JournalData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateOrUpdateJournalResponseToJson(
  CreateOrUpdateJournalResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
