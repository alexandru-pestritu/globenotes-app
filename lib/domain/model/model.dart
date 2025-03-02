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
  final int id;
  final String email;
  final bool isVerified;
  final String updatedAt;

  User(this.id, this.email, this.isVerified, this.updatedAt);
}
