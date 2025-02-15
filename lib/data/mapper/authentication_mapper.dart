import 'package:globenotes/app/extensions.dart';
import 'package:globenotes/data/responses/auth_responses.dart';
import 'package:globenotes/domain/authentication.dart';

extension LoginDataMapper on LoginData? {
  Authentication toDomain() {
    return Authentication(
      this?.accessToken?.orEmpty() ?? empty,
      this?.refreshToken?.orEmpty() ?? empty,
    );
  }
}

extension LoginResponseMapper on LoginResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.data?.accessToken?.orEmpty() ?? empty,
      this?.data?.refreshToken?.orEmpty() ?? empty,
    );
  }
}
