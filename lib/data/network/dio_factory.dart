import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:globenotes/app/app_preferences.dart';
import 'package:globenotes/app/constants.dart';
import 'package:globenotes/data/data_source/secure_storage_local_data_source.dart';
import 'package:globenotes/data/network/interceptors/auth_interceptor.dart';
import 'package:globenotes/data/network/interceptors/refresh_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String defaultLanguage = "language";

class DioFactory {
  final AppPreferences _appPreferences;
  final SecureStorageLocalDataSource _secureStorageLocalDataSource;

  DioFactory(this._appPreferences, this._secureStorageLocalDataSource);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration timeout = Duration(seconds: 60);
    Locale appLocale = await _appPreferences.getAppLanguage();
    String language = appLocale.languageCode;

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      headers: headers,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    dio.interceptors.add(AuthInterceptor(_secureStorageLocalDataSource));
    dio.interceptors.add(
      RefreshTokenInterceptor(dio, _secureStorageLocalDataSource),
    );

    return dio;
  }
}
