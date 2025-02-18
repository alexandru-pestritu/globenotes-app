import 'package:globenotes/data/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class LoginData {
  @JsonKey(name: "access_token")
  String? accessToken;

  @JsonKey(name: "refresh_token")
  String? refreshToken;

  LoginData({this.accessToken, this.refreshToken});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: "data")
  LoginData? data;

  LoginResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
