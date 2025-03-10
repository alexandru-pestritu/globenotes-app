import 'package:json_annotation/json_annotation.dart';
import 'package:globenotes/data/dto/location/location_dtos.dart';
import 'package:globenotes/data/dto/category/category_dtos.dart';
import 'package:globenotes/data/dto/moment_media/moment_media_dtos.dart';

part 'moment_dtos.g.dart';

@JsonSerializable()
class MomentDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "journalId")
  int? journalId;

  @JsonKey(name: "locationId")
  int? locationId;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "categoryId")
  int? categoryId;

  @JsonKey(name: "dateTime")
  String? dateTime;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "isDeleted")
  bool? isDeleted;

  MomentDTO({
    this.id,
    this.journalId,
    this.locationId,
    this.name,
    this.description,
    this.categoryId,
    this.dateTime,
    this.updatedAt,
    this.isDeleted,
  });

  factory MomentDTO.fromJson(Map<String, dynamic> json) =>
      _$MomentDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MomentDTOToJson(this);
}

@JsonSerializable()
class MomentDetailsDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "journalId")
  int? journalId;

  @JsonKey(name: "location")
  LocationDetailsDTO? location;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "category")
  CategoryDTO? category;

  @JsonKey(name: "dateTime")
  String? dateTime;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "isDeleted")
  bool? isDeleted;

  @JsonKey(name: "momentMediaList")
  List<MomentMediaDTO>? momentMediaList;

  MomentDetailsDTO({
    this.id,
    this.journalId,
    this.location,
    this.name,
    this.description,
    this.category,
    this.dateTime,
    this.updatedAt,
    this.isDeleted,
    this.momentMediaList,
  });

  factory MomentDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$MomentDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MomentDetailsDTOToJson(this);
}
