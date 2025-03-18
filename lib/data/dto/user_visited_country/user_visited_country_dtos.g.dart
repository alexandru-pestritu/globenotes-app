// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_visited_country_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVisitedCountryDTO _$UserVisitedCountryDTOFromJson(
  Map<String, dynamic> json,
) => UserVisitedCountryDTO(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  countryId: (json['countryId'] as num?)?.toInt(),
  visitedAt: json['visitedAt'] as String?,
  isDeleted: json['deleted'] as bool?,
);

Map<String, dynamic> _$UserVisitedCountryDTOToJson(
  UserVisitedCountryDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'countryId': instance.countryId,
  'visitedAt': instance.visitedAt,
  'deleted': instance.isDeleted,
};

UserVisitedCountryDetailsDTO _$UserVisitedCountryDetailsDTOFromJson(
  Map<String, dynamic> json,
) => UserVisitedCountryDetailsDTO(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  country:
      json['country'] == null
          ? null
          : CountryDetailsDTO.fromJson(json['country'] as Map<String, dynamic>),
  visitedAt: json['visitedAt'] as String?,
  isDeleted: json['deleted'] as bool?,
);

Map<String, dynamic> _$UserVisitedCountryDetailsDTOToJson(
  UserVisitedCountryDetailsDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'country': instance.country,
  'visitedAt': instance.visitedAt,
  'deleted': instance.isDeleted,
};

UserVisitedCountryData _$UserVisitedCountryDataFromJson(
  Map<String, dynamic> json,
) => UserVisitedCountryData(
  visitedCountry:
      json['visitedCountry'] == null
          ? null
          : UserVisitedCountryDetailsDTO.fromJson(
            json['visitedCountry'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$UserVisitedCountryDataToJson(
  UserVisitedCountryData instance,
) => <String, dynamic>{'visitedCountry': instance.visitedCountry};

AddVisitedCountryResponse _$AddVisitedCountryResponseFromJson(
  Map<String, dynamic> json,
) => AddVisitedCountryResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : UserVisitedCountryData.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$AddVisitedCountryResponseToJson(
  AddVisitedCountryResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

VisitedCountriesData _$VisitedCountriesDataFromJson(
  Map<String, dynamic> json,
) => VisitedCountriesData(
  visitedCountries:
      (json['visitedCountries'] as List<dynamic>?)
          ?.map(
            (e) => UserVisitedCountryDetailsDTO.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
);

Map<String, dynamic> _$VisitedCountriesDataToJson(
  VisitedCountriesData instance,
) => <String, dynamic>{'visitedCountries': instance.visitedCountries};

GetVisitedCountriesResponse _$GetVisitedCountriesResponseFromJson(
  Map<String, dynamic> json,
) => GetVisitedCountriesResponse(
  timeStamp: json['timeStamp'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : VisitedCountriesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetVisitedCountriesResponseToJson(
  GetVisitedCountriesResponse instance,
) => <String, dynamic>{
  'timeStamp': instance.timeStamp,
  'statusCode': instance.statusCode,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
