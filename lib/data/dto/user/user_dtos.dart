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
