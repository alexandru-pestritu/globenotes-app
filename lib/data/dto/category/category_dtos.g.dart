// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

MomentCategoriesData _$MomentCategoriesDataFromJson(
  Map<String, dynamic> json,
) => MomentCategoriesData(
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MomentCategoriesDataToJson(
  MomentCategoriesData instance,
) => <String, dynamic>{'categories': instance.categories};

GetMomentCategoriesResponse _$GetMomentCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => GetMomentCategoriesResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : MomentCategoriesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetMomentCategoriesResponseToJson(
  GetMomentCategoriesResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
