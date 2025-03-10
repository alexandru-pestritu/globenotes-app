import 'package:json_annotation/json_annotation.dart';

part 'moment_media_dtos.g.dart';

@JsonSerializable()
class MomentMediaDTO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "momentId")
  int? momentId;

  @JsonKey(name: "mediaUrl")
  String? mediaUrl;

  @JsonKey(name: "mediaType")
  String? mediaType;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "isDeleted")
  bool? isDeleted;

  MomentMediaDTO({
    this.id,
    this.momentId,
    this.mediaUrl,
    this.mediaType,
    this.updatedAt,
    this.isDeleted,
  });

  factory MomentMediaDTO.fromJson(Map<String, dynamic> json) =>
      _$MomentMediaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MomentMediaDTOToJson(this);
}
