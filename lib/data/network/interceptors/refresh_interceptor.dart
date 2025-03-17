import 'package:dio/dio.dart';
import 'package:globenotes/data/data_source/local/secure_storage_local_data_source.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/dto/auth/auth_dtos.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio _dio;
  final SecureStorageLocalDataSource _secureStorageLocalDataSource;

  RefreshTokenInterceptor(this._dio, this._secureStorageLocalDataSource);

  bool _isRefreshing = false;
  Future<void>? _refreshFuture;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refreshToken =
          await _secureStorageLocalDataSource.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        // logout
        return super.onError(err, handler);
      }

      try {
        if (_isRefreshing) {
          await _refreshFuture;
        } else {
          _isRefreshing = true;
          _refreshFuture = _refreshToken(refreshToken);
          await _refreshFuture;
        }

        _isRefreshing = false;
        final RequestOptions requestOptions = err.requestOptions;
        final newAccessToken =
            await _secureStorageLocalDataSource.getAccessToken();
        requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

        final response = await _dio.fetch(requestOptions);
        return handler.resolve(response);
      } catch (refreshError) {
        // logout
        return super.onError(err, handler);
      }
    } else {
      // logout
      return super.onError(err, handler);
    }
  }

  Future<void> _refreshToken(String refreshToken) async {
    final response = await _dio.post(
      '/auth/refresh',
      data: {"refreshToken": refreshToken},
    );

    final newTokens = RefreshTokenResponse.fromJson(response.data);
    if (newTokens.data != null &&
        newTokens.statusCode == ResponseCode.success) {
      final newAccess = newTokens.data!.accessToken!;
      final newRefresh = newTokens.data!.refreshToken!;
      await _secureStorageLocalDataSource.saveAuthTokens(newAccess, newRefresh);
    } else {
      throw DioException(requestOptions: response.requestOptions);
    }
  }
}
