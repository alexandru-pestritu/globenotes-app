import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:globenotes/app/app_preferences.dart';
import 'package:globenotes/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration timeout = Duration(seconds: 60);
    String language = await _appPreferences.getAppLanguage();
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

    return dio;
  }
}
