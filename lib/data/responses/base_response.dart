import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "timeStamp")
  String? timeStamp;

  @JsonKey(name: "statusCode")
  int? statusCode;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "message")
  String? message;

  BaseResponse({this.timeStamp, this.statusCode, this.status, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
