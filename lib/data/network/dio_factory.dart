import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:globenotes/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration timeout = Duration(seconds: 60);
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
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
