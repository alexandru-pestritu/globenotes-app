import 'package:dio/dio.dart';
import 'package:globenotes/data/network/failure.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectionTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unauthorised:
            return DataSource.unauthorised.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            return DataSource.defaultError.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.unknown:
        return DataSource.defaultError.getFailure();
      default:
        return DataSource.defaultError.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError,
        );
      case DataSource.connectionTimeout:
        return Failure(
          ResponseCode.connectionTimeout,
          ResponseMessage.connectionTimeout,
        );
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          ResponseMessage.receiveTimeout,
        );
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unauthorised = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;

  static const int defaultError = -1;
  static const int connectionTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  static const String success = "Success";
  static const String noContent = "Success with no content";
  static const String badRequest = "Bad request, try again later";
  static const String forbidden = "Forbidden request, try again later";
  static const String unauthorised = "User is unauthorized, try again later";
  static const String notFound = "URL is not found, try again later";
  static const String internalServerError =
      "Something went wrong, try again later";

  static const String defaultError = "Something went wrong, try again later";
  static const String connectionTimeout = "Timeout error, try again later";
  static const String cancel = "Request was cancelled, try again later";
  static const String receiveTimeout = "Timeout error, try again later";
  static const String sendTimeout = "Timeout error, try again later";
  static const String cacheError = "Cache error, try again later";
  static const String noInternetConnection =
      "Please check your internet connection";
}
