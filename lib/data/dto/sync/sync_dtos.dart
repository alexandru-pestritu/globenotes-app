import 'package:globenotes/data/dto/response/base_response.dart';
import 'package:globenotes/data/dto/user_profile/user_profile_dtos.dart';
import 'package:globenotes/data/dto/user_visited_country/user_visited_country_dtos.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:globenotes/data/dto/user/user_dtos.dart';
import 'package:globenotes/data/dto/journal/journal_dtos.dart';
import 'package:globenotes/data/dto/moment/moment_dtos.dart';

part 'sync_dtos.g.dart';

@JsonSerializable()
class SyncDataDTO {
  @JsonKey(name: "user")
  UserDTO? user;

  @JsonKey(name: "userProfile")
  UserProfileDetailsDTO? userProfile;

  @JsonKey(name: "userVisitedCountries")
  List<UserVisitedCountryDetailsDTO>? userVisitedCountries;

  @JsonKey(name: "journals")
  List<JournalDTO>? journals;

  @JsonKey(name: "moments")
  List<MomentDetailsDTO>? moments;

  SyncDataDTO({
    this.user,
    this.userProfile,
    this.userVisitedCountries,
    this.journals,
    this.moments,
  });

  factory SyncDataDTO.fromJson(Map<String, dynamic> json) =>
      _$SyncDataDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SyncDataDTOToJson(this);
}

@JsonSerializable()
class SyncWrapperData {
  @JsonKey(name: "sync")
  SyncDataDTO? sync;

  SyncWrapperData({this.sync});

  factory SyncWrapperData.fromJson(Map<String, dynamic> json) =>
      _$SyncWrapperDataFromJson(json);

  Map<String, dynamic> toJson() => _$SyncWrapperDataToJson(this);
}

@JsonSerializable()
class SyncDataResponse extends BaseResponse {
  @JsonKey(name: "data")
  SyncWrapperData? data;

  SyncDataResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory SyncDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncDataResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SyncDataResponseToJson(this);
}
