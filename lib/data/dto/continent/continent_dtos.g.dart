// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continent_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContinentDTO _$ContinentDTOFromJson(Map<String, dynamic> json) => ContinentDTO(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
);

Map<String, dynamic> _$ContinentDTOToJson(ContinentDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

ContinentDetailsDTO _$ContinentDetailsDTOFromJson(Map<String, dynamic> json) =>
    ContinentDetailsDTO(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      countries:
          (json['countries'] as List<dynamic>?)
              ?.map((e) => CountryDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ContinentDetailsDTOToJson(
  ContinentDetailsDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'countries': instance.countries,
};
