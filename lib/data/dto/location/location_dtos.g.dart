// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDTO _$LocationDTOFromJson(Map<String, dynamic> json) => LocationDTO(
  id: (json['id'] as num?)?.toInt(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  formattedAddress: json['formattedAddress'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  countryId: (json['countryId'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] as String?,
  isDeleted: json['isDeleted'] as bool?,
);

Map<String, dynamic> _$LocationDTOToJson(LocationDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'formattedAddress': instance.formattedAddress,
      'city': instance.city,
      'state': instance.state,
      'countryId': instance.countryId,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
    };

LocationDetailsDTO _$LocationDetailsDTOFromJson(Map<String, dynamic> json) =>
    LocationDetailsDTO(
      id: (json['id'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      formattedAddress: json['formattedAddress'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country:
          json['country'] == null
              ? null
              : CountryDetailsDTO.fromJson(
                json['country'] as Map<String, dynamic>,
              ),
      updatedAt: json['updatedAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$LocationDetailsDTOToJson(LocationDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'formattedAddress': instance.formattedAddress,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
    };
