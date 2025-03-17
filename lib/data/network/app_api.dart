import 'package:dio/dio.dart';
import 'package:globenotes/app/constants.dart';
import 'package:globenotes/data/dto/auth/auth_dtos.dart';
import 'package:globenotes/data/dto/continent/continent_dtos.dart';
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

  @POST("/auth/login/google")
  Future<LoginResponse> loginWithGoogle(@Field("idToken") String idToken);

  @POST("/auth/login/facebook")
  Future<LoginResponse> loginWithFacebook(@Field("idToken") String idToken);

  @POST("/auth/register")
  Future<RegisterResponse> register(
    @Field("name") String name,
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/auth/register/resend-otp")
  Future<ResendVerifyEmailResponse> resendVerifyEmail(
    @Field("email") String email,
  );

  @POST("/auth/verify-email")
  Future<VerifyEmailResponse> verifyEmail(
    @Field("email") String email,
    @Field("code") String code,
  );

  @POST("/auth/forgot-password")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);

  @POST("/auth/forgot-password/verify-otp")
  Future<VerifyForgotPasswordResponse> verifyForgotPassword(
    @Field("email") String email,
    @Field("code") String code,
  );

  @POST("/auth/reset-password")
  Future<ResetPasswordResponse> resetPassword(
    @Field("email") String email,
    @Field("otpCode") String code,
    @Field("newPassword") String password,
  );

  @GET("/location/continents/countries")
  Future<GetAllContinentsWithCountriesResponse> getAllContinentsWithCountries();
}
