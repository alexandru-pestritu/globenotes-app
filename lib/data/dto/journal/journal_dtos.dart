import 'package:globenotes/data/dto/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:globenotes/data/dto/location/location_dtos.dart';
import 'package:globenotes/data/dto/moment/moment_dtos.dart';

part 'journal_dtos.g.dart';

@JsonSerializable()
class JournalDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "userId")
  int? userId;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "shortSummary")
  String? shortSummary;

  @JsonKey(name: "tripLocation")
  LocationDetailsDTO? tripLocation;

  @JsonKey(name: "coverPhotoUrl")
  String? coverPhotoUrl;

  @JsonKey(name: "startDate")
  String? startDate;

  @JsonKey(name: "endDate")
  String? endDate;

  @JsonKey(name: "remindersEnabled")
  bool? remindersEnabled;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "isDeleted")
  bool? isDeleted;

  JournalDTO({
    this.id,
    this.userId,
    this.name,
    this.shortSummary,
    this.tripLocation,
    this.coverPhotoUrl,
    this.startDate,
    this.endDate,
    this.remindersEnabled,
    this.updatedAt,
    this.isDeleted,
  });

  factory JournalDTO.fromJson(Map<String, dynamic> json) =>
      _$JournalDTOFromJson(json);

  Map<String, dynamic> toJson() => _$JournalDTOToJson(this);
}

@JsonSerializable()
class JournalDetailsDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "userId")
  int? userId;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "shortSummary")
  String? shortSummary;

  @JsonKey(name: "tripLocation")
  LocationDetailsDTO? tripLocation;

  @JsonKey(name: "coverPhotoUrl")
  String? coverPhotoUrl;

  @JsonKey(name: "startDate")
  String? startDate;

  @JsonKey(name: "endDate")
  String? endDate;

  @JsonKey(name: "remindersEnabled")
  bool? remindersEnabled;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "isDeleted")
  bool? isDeleted;

  @JsonKey(name: "moments")
  List<MomentDetailsDTO>? moments;

  JournalDetailsDTO({
    this.id,
    this.userId,
    this.name,
    this.shortSummary,
    this.tripLocation,
    this.coverPhotoUrl,
    this.startDate,
    this.endDate,
    this.remindersEnabled,
    this.updatedAt,
    this.isDeleted,
    this.moments,
  });

  factory JournalDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$JournalDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$JournalDetailsDTOToJson(this);
}

@JsonSerializable()
class JournalListData {
  @JsonKey(name: "journals")
  List<JournalDTO>? journals;

  JournalListData({this.journals});

  factory JournalListData.fromJson(Map<String, dynamic> json) =>
      _$JournalListDataFromJson(json);

  Map<String, dynamic> toJson() => _$JournalListDataToJson(this);
}

@JsonSerializable()
class GetJournalsResponse extends BaseResponse {
  @JsonKey(name: "data")
  JournalListData? data;

  GetJournalsResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory GetJournalsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJournalsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetJournalsResponseToJson(this);
}

@JsonSerializable()
class JournalData {
  @JsonKey(name: "journal")
  JournalDetailsDTO? journal;

  JournalData({this.journal});

  factory JournalData.fromJson(Map<String, dynamic> json) =>
      _$JournalDataFromJson(json);

  Map<String, dynamic> toJson() => _$JournalDataToJson(this);
}

@JsonSerializable()
class CreateOrUpdateJournalResponse extends BaseResponse {
  @JsonKey(name: "data")
  JournalData? data;

  CreateOrUpdateJournalResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory CreateOrUpdateJournalResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrUpdateJournalResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateOrUpdateJournalResponseToJson(this);
}
