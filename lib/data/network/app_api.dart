import 'package:dio/dio.dart';
import 'package:globenotes/app/constants.dart';
import 'package:globenotes/data/dto/auth/auth_dtos.dart';
import 'package:globenotes/data/dto/category/category_dtos.dart';
import 'package:globenotes/data/dto/continent/continent_dtos.dart';
import 'package:globenotes/data/dto/journal/journal_dtos.dart';
import 'package:globenotes/data/dto/moment/moment_dtos.dart';
import 'package:globenotes/data/dto/response/base_response.dart';
import 'package:globenotes/data/dto/user/user_dtos.dart';
import 'package:globenotes/data/dto/user_profile/user_profile_dtos.dart';
import 'package:globenotes/data/dto/user_visited_country/user_visited_country_dtos.dart';
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

  @GET("/user/profile")
  Future<GetOrUpdateProfileResponse> getUserProfile();

  @PUT("/user/profile")
  Future<GetOrUpdateProfileResponse> updateUserProfile(
    @Body() UserProfileDetailsDTO request,
  );

  @GET("/user/")
  Future<GetUserResponse> getUser();

  @DELETE("/user/")
  Future<BaseResponse> deleteUser();

  @POST("/user/password")
  Future<BaseResponse> updatePassword(@Body() UpdatePasswordRequest request);

  @POST("/user/email")
  Future<BaseResponse> updateEmail(@Body() UpdateEmailRequest request);

  @POST("/user/visited-countries")
  Future<AddVisitedCountryResponse> addUserVisitedCountry(
    @Body() UserVisitedCountryDTO request,
  );

  @GET("/user/visited-countries")
  Future<GetVisitedCountriesResponse> getVisitedCountries();

  @DELETE("/user/visited-countries/{userVisitedCountryId}")
  Future<BaseResponse> deleteUserVisitedCountry(
    @Path("userVisitedCountryId") int userVisitedCountryId,
  );

  @GET("/journal")
  Future<GetJournalsResponse> getJournals();

  @POST("/journal")
  Future<CreateOrUpdateJournalResponse> createJournal(
    @Body() JournalDTO request,
  );

  @PUT("/journal")
  Future<CreateOrUpdateJournalResponse> updateJournal(
    @Body() JournalDTO request,
  );

  @GET("/journal/{journalId}")
  Future<CreateOrUpdateJournalResponse> getJournalDetails(
    @Path("journalId") int journalId,
  );

  @DELETE("/journal/{journalId}")
  Future<BaseResponse> deleteJournal(@Path("journalId") int journalId);

  @POST("/moment")
  Future<CreateOrUpdateMomentResponse> createMoment(
    @Body() MomentDetailsDTO request,
  );

  @PUT("/moment")
  Future<CreateOrUpdateMomentResponse> updateMoment(
    @Body() MomentDetailsDTO request,
  );

  @GET("/moment/{momentId}")
  Future<CreateOrUpdateMomentResponse> getMoment(
    @Path("momentId") int momentId,
  );

  @DELETE("/moment/{momentId}")
  Future<BaseResponse> deleteMoment(@Path("momentId") int momentId);

  @GET("/moment/journal/{journalId}")
  Future<GetMomentsByJournalResponse> getMomentsByJournal(
    @Path("journalId") int journalId,
  );

  @GET("/moment/categories")
  Future<GetMomentCategoriesResponse> getAllCategories();
}
