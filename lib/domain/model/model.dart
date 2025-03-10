class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Authentication {
  final String accessToken;
  final String refreshToken;

  Authentication(this.accessToken, this.refreshToken);
}

class User {
  final String? serverId;
  final int localId;
  final String email;
  final bool isVerified;
  final String updatedAt;

  User(
    this.serverId,
    this.localId,
    this.email,
    this.isVerified,
    this.updatedAt,
  );
}

class Continent {
  final String? serverId;
  final int localId;
  final String name;
  final String? code;

  Continent({
    required this.serverId,
    required this.localId,
    required this.name,
    this.code,
  });
}

class Country {
  final String? serverId;
  final int localId;
  final String name;
  final String? isoCode;

  final Continent continent;

  Country({
    required this.serverId,
    required this.localId,
    required this.name,
    this.isoCode,
    required this.continent,
  });
}

class Location {
  final String? serverId;
  final int localId;

  final double latitude;
  final double longitude;

  final String? formattedAddress;
  final String? city;
  final String? state;
  final String? googlePlaceId;

  final String updatedAt;

  final Country country;

  Location({
    required this.serverId,
    required this.localId,
    required this.latitude,
    required this.longitude,
    this.formattedAddress,
    this.city,
    this.state,
    this.googlePlaceId,
    required this.updatedAt,
    required this.country,
  });
}

class Category {
  final String? serverId;
  final int localId;
  final String name;

  Category({required this.serverId, required this.localId, required this.name});
}

class UserProfile {
  final String? serverId;
  final int localId;

  final String name;
  final String? profilePhotoUrl;
  final String? coverPhotoUrl;

  final String? profileLocalFilePath;
  final String? coverLocalFilePath;

  final String? bio;
  final String updatedAt;

  final Location? location;

  UserProfile({
    required this.serverId,
    required this.localId,
    required this.name,
    this.profilePhotoUrl,
    this.coverPhotoUrl,
    this.profileLocalFilePath,
    this.coverLocalFilePath,
    this.bio,
    required this.updatedAt,
    this.location,
  });
}

class UserVisitedCountry {
  final String? serverId;
  final int localId;

  final int userId;
  final Country country;

  final String visitedAt;

  UserVisitedCountry({
    required this.serverId,
    required this.localId,
    required this.userId,
    required this.country,
    required this.visitedAt,
  });
}

class Journal {
  final String? serverId;
  final int localId;

  final String name;
  final String? shortSummary;

  final Location location;

  final String startDate;
  final String? endDate;

  final String? coverPhotoUrl;
  final String? coverLocalFilePath;

  final bool remindersEnabled;
  final String updatedAt;

  Journal({
    required this.serverId,
    required this.localId,
    required this.name,
    this.shortSummary,
    required this.location,
    required this.startDate,
    this.endDate,
    this.coverPhotoUrl,
    this.coverLocalFilePath,
    required this.remindersEnabled,
    required this.updatedAt,
  });
}

class MomentMedia {
  final String? serverId;
  final int localId;

  final int momentId;

  final String mediaUrl;
  final String? mediaType;
  final String? localFilePath;
  final String updatedAt;

  MomentMedia({
    required this.serverId,
    required this.localId,
    required this.momentId,
    required this.mediaUrl,
    this.mediaType,
    this.localFilePath,
    required this.updatedAt,
  });
}

class Moment {
  final String? serverId;
  final int localId;

  final int journalId;
  final Location location;
  final Category? category;

  final String name;
  final String? description;
  final String timestamp;
  final String updatedAt;

  final List<MomentMedia> mediaList = [];

  Moment({
    required this.serverId,
    required this.localId,
    required this.journalId,
    required this.location,
    this.category,
    required this.name,
    this.description,
    required this.timestamp,
    required this.updatedAt,
    List<MomentMedia>? mediaList,
  });
}

class SyncHistoryEntry {
  final int localId;
  final String syncStatus;
  final String? syncType;
  final String syncTime;
  final String? syncMessage;

  SyncHistoryEntry({
    required this.localId,
    required this.syncStatus,
    this.syncType,
    required this.syncTime,
    this.syncMessage,
  });
}
