// GENERATED CODE - DO NOT MODIFY BY HAND

part of 's3_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresignedUploadRequestDTO _$PresignedUploadRequestDTOFromJson(
  Map<String, dynamic> json,
) => PresignedUploadRequestDTO(
  fileName: json['fileName'] as String,
  contentType: json['contentType'] as String,
);

Map<String, dynamic> _$PresignedUploadRequestDTOToJson(
  PresignedUploadRequestDTO instance,
) => <String, dynamic>{
  'fileName': instance.fileName,
  'contentType': instance.contentType,
};

PresignedUrlDTO _$PresignedUrlDTOFromJson(Map<String, dynamic> json) =>
    PresignedUrlDTO(
      key: json['key'] as String,
      presignedUrl: json['presignedUrl'] as String,
    );

Map<String, dynamic> _$PresignedUrlDTOToJson(PresignedUrlDTO instance) =>
    <String, dynamic>{
      'key': instance.key,
      'presignedUrl': instance.presignedUrl,
    };

GetKeysRequest _$GetKeysRequestFromJson(Map<String, dynamic> json) =>
    GetKeysRequest(
      keys: (json['keys'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetKeysRequestToJson(GetKeysRequest instance) =>
    <String, dynamic>{'keys': instance.keys};

PutPresignedData _$PutPresignedDataFromJson(Map<String, dynamic> json) =>
    PutPresignedData(
      presigned:
          (json['presigned'] as List<dynamic>?)
              ?.map((e) => PresignedUrlDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PutPresignedDataToJson(PutPresignedData instance) =>
    <String, dynamic>{'presigned': instance.presigned};

PutPresignedUrlResponse _$PutPresignedUrlResponseFromJson(
  Map<String, dynamic> json,
) => PutPresignedUrlResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : PutPresignedData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PutPresignedUrlResponseToJson(
  PutPresignedUrlResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

GetPresignedData _$GetPresignedDataFromJson(Map<String, dynamic> json) =>
    GetPresignedData(
      urls:
          (json['urls'] as List<dynamic>?)
              ?.map((e) => PresignedUrlDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GetPresignedDataToJson(GetPresignedData instance) =>
    <String, dynamic>{'urls': instance.urls};

GetPresignedUrlResponse _$GetPresignedUrlResponseFromJson(
  Map<String, dynamic> json,
) => GetPresignedUrlResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : GetPresignedData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetPresignedUrlResponseToJson(
  GetPresignedUrlResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
