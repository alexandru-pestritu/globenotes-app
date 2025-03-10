import 'package:globenotes/data/dto/country/country_dtos.dart';
import 'package:json_annotation/json_annotation.dart';
part 'continent_dtos.g.dart';

@JsonSerializable()
class ContinentDTO {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;

  ContinentDTO({this.id, this.name, this.code});

  factory ContinentDTO.fromJson(Map<String, dynamic> json) =>
      _$ContinentDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ContinentDTOToJson(this);
}

@JsonSerializable()
class ContinentDetailsDTO {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "countries")
  List<CountryDTO>? countries;

  ContinentDetailsDTO({this.id, this.name, this.code, this.countries});

  factory ContinentDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$ContinentDetailsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ContinentDetailsDTOToJson(this);
}
