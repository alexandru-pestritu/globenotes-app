// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDTO _$CountryDTOFromJson(Map<String, dynamic> json) => CountryDTO(
  id: (json['id'] as num?)?.toInt(),
  continentId: (json['continentId'] as num?)?.toInt(),
  name: json['name'] as String?,
  isoCode: json['isoCode'] as String?,
);

Map<String, dynamic> _$CountryDTOToJson(CountryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'continentId': instance.continentId,
      'name': instance.name,
      'isoCode': instance.isoCode,
    };

CountryDetailsDTO _$CountryDetailsDTOFromJson(Map<String, dynamic> json) =>
    CountryDetailsDTO(
      id: (json['id'] as num?)?.toInt(),
      continent:
          json['continent'] == null
              ? null
              : ContinentDTO.fromJson(
                json['continent'] as Map<String, dynamic>,
              ),
      name: json['name'] as String?,
      isoCode: json['isoCode'] as String?,
    );

Map<String, dynamic> _$CountryDetailsDTOToJson(CountryDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'continent': instance.continent,
      'name': instance.name,
      'isoCode': instance.isoCode,
    };
