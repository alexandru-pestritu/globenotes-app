import 'package:dio/dio.dart';
import 'package:globenotes/app/constants.dart';
import 'package:globenotes/data/response/responses.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/auth/login")
  Future<LoginResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
