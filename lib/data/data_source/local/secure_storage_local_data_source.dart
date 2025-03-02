import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String keyAccessToken = 'KEY_ACCESS_TOKEN';
const String keyRefreshToken = 'KEY_REFRESH_TOKEN';

abstract class SecureStorageLocalDataSource {
  Future<void> saveAuthTokens(String accessToken, String refreshToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearAuthTokens();
}

class SecureStorageLocalDataSourceImpl implements SecureStorageLocalDataSource {
  final FlutterSecureStorage _secureStorage;

  SecureStorageLocalDataSourceImpl(this._secureStorage);

  @override
  Future<void> saveAuthTokens(String accessToken, String refreshToken) async {
    await _secureStorage.write(key: keyAccessToken, value: accessToken);
    await _secureStorage.write(key: keyRefreshToken, value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return _secureStorage.read(key: keyAccessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _secureStorage.read(key: keyRefreshToken);
  }

  @override
  Future<void> clearAuthTokens() async {
    await _secureStorage.delete(key: keyAccessToken);
    await _secureStorage.delete(key: keyRefreshToken);
  }
}
