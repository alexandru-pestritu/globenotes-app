import 'package:globenotes/data/dto/response/base_response.dart';
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

@JsonSerializable()
class UserVisitedCountryData {
  @JsonKey(name: "visitedCountry")
  UserVisitedCountryDetailsDTO? visitedCountry;

  UserVisitedCountryData({this.visitedCountry});

  factory UserVisitedCountryData.fromJson(Map<String, dynamic> json) =>
      _$UserVisitedCountryDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserVisitedCountryDataToJson(this);
}

@JsonSerializable()
class AddVisitedCountryResponse extends BaseResponse {
  @JsonKey(name: "data")
  UserVisitedCountryData? data;

  AddVisitedCountryResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory AddVisitedCountryResponse.fromJson(Map<String, dynamic> json) =>
      _$AddVisitedCountryResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddVisitedCountryResponseToJson(this);
}

@JsonSerializable()
class VisitedCountriesData {
  @JsonKey(name: "visitedCountries")
  List<UserVisitedCountryDetailsDTO>? visitedCountries;

  VisitedCountriesData({this.visitedCountries});

  factory VisitedCountriesData.fromJson(Map<String, dynamic> json) =>
      _$VisitedCountriesDataFromJson(json);
  Map<String, dynamic> toJson() => _$VisitedCountriesDataToJson(this);
}

@JsonSerializable()
class GetVisitedCountriesResponse extends BaseResponse {
  @JsonKey(name: "data")
  VisitedCountriesData? data;

  GetVisitedCountriesResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory GetVisitedCountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVisitedCountriesResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetVisitedCountriesResponseToJson(this);
}
