import 'package:globenotes/data/dto/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 's3_dtos.g.dart';

@JsonSerializable()
class PresignedUploadRequestDTO {
  @JsonKey(name: "fileName")
  final String fileName;

  @JsonKey(name: "contentType")
  final String contentType;

  PresignedUploadRequestDTO({
    required this.fileName,
    required this.contentType,
  });

  factory PresignedUploadRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$PresignedUploadRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PresignedUploadRequestDTOToJson(this);
}

@JsonSerializable()
class PresignedUrlDTO {
  @JsonKey(name: "key")
  final String key;

  @JsonKey(name: "presignedUrl")
  final String presignedUrl;

  PresignedUrlDTO({required this.key, required this.presignedUrl});

  factory PresignedUrlDTO.fromJson(Map<String, dynamic> json) =>
      _$PresignedUrlDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PresignedUrlDTOToJson(this);
}

@JsonSerializable()
class GetKeysRequest {
  final List<String> keys;

  GetKeysRequest({required this.keys});

  factory GetKeysRequest.fromJson(Map<String, dynamic> json) =>
      _$GetKeysRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetKeysRequestToJson(this);
}

@JsonSerializable()
class PutPresignedData {
  @JsonKey(name: "presigned")
  List<PresignedUrlDTO>? presigned;

  PutPresignedData({this.presigned});

  factory PutPresignedData.fromJson(Map<String, dynamic> json) =>
      _$PutPresignedDataFromJson(json);

  Map<String, dynamic> toJson() => _$PutPresignedDataToJson(this);
}

@JsonSerializable()
class PutPresignedUrlResponse extends BaseResponse {
  @JsonKey(name: "data")
  PutPresignedData? data;

  PutPresignedUrlResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory PutPresignedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$PutPresignedUrlResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PutPresignedUrlResponseToJson(this);
}

@JsonSerializable()
class GetPresignedData {
  @JsonKey(name: "urls")
  List<PresignedUrlDTO>? urls;

  GetPresignedData({this.urls});

  factory GetPresignedData.fromJson(Map<String, dynamic> json) =>
      _$GetPresignedDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetPresignedDataToJson(this);
}

@JsonSerializable()
class GetPresignedUrlResponse extends BaseResponse {
  @JsonKey(name: "data")
  GetPresignedData? data;

  GetPresignedUrlResponse({
    super.timeStamp,
    super.statusCode,
    super.status,
    super.message,
    this.data,
  });

  factory GetPresignedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresignedUrlResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetPresignedUrlResponseToJson(this);
}
