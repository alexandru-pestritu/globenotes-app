import 'package:globenotes/data/dto/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_dtos.g.dart';

@JsonSerializable()
class UserDTO {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "verified")
  bool? isVerified;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

  UserDTO({this.id, this.email, this.isVerified, this.updatedAt});

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: "user")
  UserDTO? user;

  UserData({this.user});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class GetUserResponse extends BaseResponse {
  @JsonKey(name: "data")
  UserData? data;

  GetUserResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetUserResponseToJson(this);
}

@JsonSerializable()
class UpdatePasswordRequest {
  @JsonKey(name: "password")
  String password;

  UpdatePasswordRequest({required this.password});

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);
}

@JsonSerializable()
class UpdateEmailRequest {
  @JsonKey(name: "email")
  String email;

  UpdateEmailRequest({required this.email});

  factory UpdateEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateEmailRequestToJson(this);
}
