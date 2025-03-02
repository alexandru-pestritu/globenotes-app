import 'package:globenotes/app/extensions.dart';
import 'package:globenotes/data/dto/response/responses.dart';
import 'package:globenotes/domain/model/model.dart';

extension LoginDataMapper on AuthData? {
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
