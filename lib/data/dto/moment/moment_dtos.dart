import 'package:globenotes/data/dto/response/base_response.dart';
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

@JsonSerializable()
class MomentData {
  @JsonKey(name: "moment")
  MomentDetailsDTO? moment;

  MomentData({this.moment});

  factory MomentData.fromJson(Map<String, dynamic> json) =>
      _$MomentDataFromJson(json);
  Map<String, dynamic> toJson() => _$MomentDataToJson(this);
}

@JsonSerializable()
class CreateOrUpdateMomentResponse extends BaseResponse {
  @JsonKey(name: "data")
  MomentData? data;

  CreateOrUpdateMomentResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory CreateOrUpdateMomentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrUpdateMomentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateOrUpdateMomentResponseToJson(this);
}

@JsonSerializable()
class MomentsData {
  @JsonKey(name: "moments")
  List<MomentDetailsDTO>? moments;

  MomentsData({this.moments});

  factory MomentsData.fromJson(Map<String, dynamic> json) =>
      _$MomentsDataFromJson(json);
  Map<String, dynamic> toJson() => _$MomentsDataToJson(this);
}

@JsonSerializable()
class GetMomentsByJournalResponse extends BaseResponse {
  @JsonKey(name: "data")
  MomentsData? data;

  GetMomentsByJournalResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory GetMomentsByJournalResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMomentsByJournalResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetMomentsByJournalResponseToJson(this);
}
