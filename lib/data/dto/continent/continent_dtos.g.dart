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

ContinentCountriesData _$ContinentCountriesDataFromJson(
  Map<String, dynamic> json,
) => ContinentCountriesData(
  continents:
      (json['continents'] as List<dynamic>?)
          ?.map((e) => ContinentDetailsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ContinentCountriesDataToJson(
  ContinentCountriesData instance,
) => <String, dynamic>{'continents': instance.continents};

GetAllContinentsWithCountriesResponse
_$GetAllContinentsWithCountriesResponseFromJson(Map<String, dynamic> json) =>
    GetAllContinentsWithCountriesResponse(
      timeStamp: json['timeStamp'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : ContinentCountriesData.fromJson(
                json['data'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$GetAllContinentsWithCountriesResponseToJson(
  GetAllContinentsWithCountriesResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
