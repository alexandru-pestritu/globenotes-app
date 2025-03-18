import 'package:globenotes/data/dto/response/base_response.dart';
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

@JsonSerializable()
class MomentCategoriesData {
  @JsonKey(name: "categories")
  List<CategoryDTO>? categories;

  MomentCategoriesData({this.categories});

  factory MomentCategoriesData.fromJson(Map<String, dynamic> json) =>
      _$MomentCategoriesDataFromJson(json);
  Map<String, dynamic> toJson() => _$MomentCategoriesDataToJson(this);
}

@JsonSerializable()
class GetMomentCategoriesResponse extends BaseResponse {
  @JsonKey(name: "data")
  MomentCategoriesData? data;

  GetMomentCategoriesResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory GetMomentCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMomentCategoriesResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetMomentCategoriesResponseToJson(this);
}
