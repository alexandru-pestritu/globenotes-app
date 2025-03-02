import 'package:dio/dio.dart';
import 'package:globenotes/data/data_source/local/secure_storage_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageLocalDataSource _secureStorageLocalDataSource;

  AuthInterceptor(this._secureStorageLocalDataSource);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _secureStorageLocalDataSource.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    return super.onRequest(options, handler);
  }
}
