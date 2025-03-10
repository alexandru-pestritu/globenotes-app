import 'package:json_annotation/json_annotation.dart';
import 'package:globenotes/data/dto/country/country_dtos.dart';

part 'user_visited_country_dtos.g.dart';

@JsonSerializable()
class UserVisitedCountryDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "userId")
  int? userId;

  @JsonKey(name: "countryId")
  int? countryId;

  @JsonKey(name: "visitedAt")
  String? visitedAt;

  @JsonKey(name: "deleted")
  bool? isDeleted;

  UserVisitedCountryDTO({
    this.id,
    this.userId,
    this.countryId,
    this.visitedAt,
    this.isDeleted,
  });

  factory UserVisitedCountryDTO.fromJson(Map<String, dynamic> json) =>
      _$UserVisitedCountryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserVisitedCountryDTOToJson(this);
}

@JsonSerializable()
class UserVisitedCountryDetailsDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "userId")
  int? userId;

  @JsonKey(name: "country")
  CountryDetailsDTO? country;

  @JsonKey(name: "visitedAt")
  String? visitedAt;

  @JsonKey(name: "deleted")
  bool? isDeleted;

  UserVisitedCountryDetailsDTO({
    this.id,
    this.userId,
    this.country,
    this.visitedAt,
    this.isDeleted,
  });

  factory UserVisitedCountryDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$UserVisitedCountryDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserVisitedCountryDetailsDTOToJson(this);
}
