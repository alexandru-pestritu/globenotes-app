import 'package:json_annotation/json_annotation.dart';

part 'category_dtos.g.dart';

@JsonSerializable()
class CategoryDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  CategoryDTO({this.id, this.name});

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}
