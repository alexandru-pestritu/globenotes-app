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
