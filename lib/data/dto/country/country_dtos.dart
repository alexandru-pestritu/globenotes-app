import 'package:globenotes/data/dto/continent/continent_dtos.dart';
import 'package:json_annotation/json_annotation.dart';
part 'country_dtos.g.dart';

@JsonSerializable()
class CountryDTO {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "continentId")
  int? continentId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "isoCode")
  String? isoCode;

  CountryDTO({this.id, this.continentId, this.name, this.isoCode});

  factory CountryDTO.fromJson(Map<String, dynamic> json) =>
      _$CountryDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CountryDTOToJson(this);
}

@JsonSerializable()
class CountryDetailsDTO {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "continent")
  ContinentDTO? continent;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "isoCode")
  String? isoCode;

  CountryDetailsDTO({this.id, this.continent, this.name, this.isoCode});

  factory CountryDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CountryDetailsDTOToJson(this);
}
