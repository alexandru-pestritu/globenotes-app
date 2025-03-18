import 'package:globenotes/data/dto/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:globenotes/data/dto/location/location_dtos.dart';

part 'user_profile_dtos.g.dart';

@JsonSerializable()
class UserProfileDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "userId")
  int? userId;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "profilePhotoUrl")
  String? profilePhotoUrl;

  @JsonKey(name: "coverPhotoUrl")
  String? coverPhotoUrl;

  @JsonKey(name: "bio")
  String? bio;

  @JsonKey(name: "locationId")
  int? locationId;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  UserProfileDTO({
    this.id,
    this.userId,
    this.name,
    this.profilePhotoUrl,
    this.coverPhotoUrl,
    this.bio,
    this.locationId,
    this.updatedAt,
  });

  factory UserProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDTOToJson(this);
}

@JsonSerializable()
class UserProfileDetailsDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "profilePhotoUrl")
  String? profilePhotoUrl;

  @JsonKey(name: "coverPhotoUrl")
  String? coverPhotoUrl;

  @JsonKey(name: "bio")
  String? bio;

  @JsonKey(name: "location")
  LocationDetailsDTO? location;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  UserProfileDetailsDTO({
    this.id,
    this.name,
    this.profilePhotoUrl,
    this.coverPhotoUrl,
    this.bio,
    this.location,
    this.updatedAt,
  });

  factory UserProfileDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDetailsDTOToJson(this);
}

@JsonSerializable()
class ProfileData {
  @JsonKey(name: "profile")
  UserProfileDetailsDTO? profile;

  ProfileData({this.profile});

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}

@JsonSerializable()
class GetOrUpdateProfileResponse extends BaseResponse {
  @JsonKey(name: "data")
  ProfileData? data;

  GetOrUpdateProfileResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory GetOrUpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrUpdateProfileResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetOrUpdateProfileResponseToJson(this);
}
