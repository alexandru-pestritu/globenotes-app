import 'package:json_annotation/json_annotation.dart';
import 'package:globenotes/data/dto/country/country_dtos.dart';

part 'location_dtos.g.dart';

@JsonSerializable()
class LocationDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "latitude")
  double? latitude;

  @JsonKey(name: "longitude")
  double? longitude;

  @JsonKey(name: "formattedAddress")
  String? formattedAddress;

  @JsonKey(name: "city")
  String? city;

  @JsonKey(name: "state")
  String? state;

  @JsonKey(name: "countryId")
  int? countryId;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "isDeleted")
  bool? isDeleted;

  LocationDTO({
    this.id,
    this.latitude,
    this.longitude,
    this.formattedAddress,
    this.city,
    this.state,
    this.countryId,
    this.updatedAt,
    this.isDeleted,
  });

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);
}

@JsonSerializable()
class LocationDetailsDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "latitude")
  double? latitude;

  @JsonKey(name: "longitude")
  double? longitude;

  @JsonKey(name: "formattedAddress")
  String? formattedAddress;

  @JsonKey(name: "city")
  String? city;

  @JsonKey(name: "state")
  String? state;

  @JsonKey(name: "country")
  CountryDetailsDTO? country;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "isDeleted")
  bool? isDeleted;

  LocationDetailsDTO({
    this.id,
    this.latitude,
    this.longitude,
    this.formattedAddress,
    this.city,
    this.state,
    this.country,
    this.updatedAt,
    this.isDeleted,
  });

  factory LocationDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDetailsDTOToJson(this);
}
