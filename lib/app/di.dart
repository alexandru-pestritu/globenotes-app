import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:globenotes/app/app_preferences.dart';
import 'package:globenotes/data/data_source/local/category_local_data_source.dart';
import 'package:globenotes/data/data_source/local/continent_local_data_source.dart';
import 'package:globenotes/data/data_source/local/country_local_data_source.dart';
import 'package:globenotes/data/data_source/local/journal_local_data_source.dart';
import 'package:globenotes/data/data_source/local/location_local_data_source.dart';
import 'package:globenotes/data/data_source/local/moment_local_data_source.dart';
import 'package:globenotes/data/data_source/local/moment_media_local_data_source.dart';
import 'package:globenotes/data/data_source/local/sync_history_local_data_source.dart';
import 'package:globenotes/data/data_source/local/user_local_data_source.dart';
import 'package:globenotes/data/data_source/local/user_profile_local_data_source.dart';
import 'package:globenotes/data/data_source/local/user_visited_country_local_data_source.dart';
import 'package:globenotes/data/data_source/remote/auth_remote_data_source.dart';
import 'package:globenotes/data/data_source/local/secure_storage_local_data_source.dart';
import 'package:globenotes/data/data_source/local/social_auth_local_data_source.dart';
import 'package:globenotes/data/data_source/remote/journal_remote_data_source.dart';
import 'package:globenotes/data/data_source/remote/location_remote_data_source.dart';
import 'package:globenotes/data/data_source/remote/moment_remote_data_source.dart';
import 'package:globenotes/data/data_source/remote/s3_file_manager.dart';
import 'package:globenotes/data/data_source/remote/s3_remote_data_source.dart';
import 'package:globenotes/data/data_source/remote/sync_remote_data_source.dart';
import 'package:globenotes/data/data_source/remote/user_remote_data_source.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/network/app_api.dart';
import 'package:globenotes/data/network/dio_factory.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/data/repository/auth_repository_impl.dart';
import 'package:globenotes/data/repository/location_repository_impl.dart';
import 'package:globenotes/data/repository/moment_repository_impl.dart';
import 'package:globenotes/data/repository/s3_repository_impl.dart';
import 'package:globenotes/data/repository/sync_repository_impl.dart';
import 'package:globenotes/data/repository/user_repository_impl.dart';
import 'package:globenotes/domain/repository/auth_repository.dart';
import 'package:globenotes/domain/repository/location_repository.dart';
import 'package:globenotes/domain/repository/moment_repository.dart';
import 'package:globenotes/domain/repository/s3_repository.dart';
import 'package:globenotes/domain/repository/sync_repository.dart';
import 'package:globenotes/domain/repository/user_repository.dart';
import 'package:globenotes/domain/usecase/auth/forgot_password_usecase.dart';
import 'package:globenotes/domain/usecase/sync/get_latest_sync_history.dart';
import 'package:globenotes/domain/usecase/sync/initial_sync_usecase.dart';
import 'package:globenotes/domain/usecase/auth/login_usecase.dart';
import 'package:globenotes/domain/usecase/auth/register_usecase.dart';
import 'package:globenotes/domain/usecase/auth/resend_verify_email_usecase.dart';
import 'package:globenotes/domain/usecase/auth/reset_password_usecase.dart';
import 'package:globenotes/domain/usecase/auth/social_login_usecase.dart';
import 'package:globenotes/domain/usecase/auth/verify_email_usecase.dart';
import 'package:globenotes/domain/usecase/auth/verify_forgot_password_usecase.dart';
import 'package:globenotes/domain/usecase/user/get_user_profile_usecase.dart';
import 'package:globenotes/domain/usecase/user/logout_usecase.dart';
import 'package:globenotes/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:globenotes/presentation/initial_sync/initial_sync_viewmodel.dart';
import 'package:globenotes/presentation/login/login_viewmodel.dart';
import 'package:globenotes/presentation/profile/profile_viewmodel.dart';
import 'package:globenotes/presentation/register/register_viewmodel.dart';
import 'package:globenotes/presentation/reset_password/reset_password_viewmodel.dart';
import 'package:globenotes/presentation/settings/app_settings/app_settings_viewmodel.dart';
import 'package:globenotes/presentation/settings/language_selection/language_selection_viewmodel.dart';
import 'package:globenotes/presentation/verify_email/verify_email_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<AppDatabase>(() => AppDatabase());

  final sharedPrefs = await SharedPreferences.getInstance();

  // shared preferences instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app preferences instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance()),
  );

  // flutter secure storage instance
  instance.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );

  //secure storage local data source
  instance.registerLazySingleton<SecureStorageLocalDataSource>(
    () => SecureStorageLocalDataSourceImpl(instance()),
  );

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(Connectivity()),
  );

  // dio factory
  instance.registerLazySingleton<DioFactory>(
    () => DioFactory(instance(), instance()),
  );

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data sources
  instance.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<JournalRemoteDataSource>(
    () => JournalRemoteDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<MomentRemoteDataSource>(
    () => MomentRemoteDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<SyncRemoteDataSource>(
    () => SyncRemoteDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<S3RemoteDataSource>(
    () => S3RemoteDataSourceImpl(instance()),
  );

  // local data sources
  instance.registerLazySingleton<SocialAuthLocalDataSource>(
    () => SocialAuthLocalDataSourceImpl(),
  );
  instance.registerLazySingleton<UsersLocalDataSource>(
    () => UsersLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<UserProfilesLocalDataSource>(
    () => UserProfilesLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<UserVisitedCountriesLocalDataSource>(
    () => UserVisitedCountriesLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<CategoriesLocalDataSource>(
    () => CategoriesLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<ContinentsLocalDataSource>(
    () => ContinentsLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<CountriesLocalDataSource>(
    () => CountriesLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<LocationsLocalDataSource>(
    () => LocationsLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<JournalsLocalDataSource>(
    () => JournalsLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<MomentsLocalDataSource>(
    () => MomentsLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<MomentMediaLocalDataSource>(
    () => MomentMediaLocalDataSourceImpl(instance()),
  );
  instance.registerLazySingleton<SyncHistoryLocalDataSource>(
    () => SyncHistoryLocalDataSourceImpl(instance()),
  );

  // repositories
  instance.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
    ),
  );

  instance.registerLazySingleton<SyncRepository>(
    () => SyncRepositoryImpl(instance()),
  );

  final s3Dio = await instance<DioFactory>().getS3Dio();
  instance.registerLazySingleton<S3Repository>(
    () => S3RepositoryImpl(instance(), s3Dio, instance()),
  );
  instance.registerLazySingleton<S3FileManager>(
    () => S3FileManager(instance()),
  );

  instance.registerLazySingleton<LocationRepository>(
    () =>
        LocationRepositoryImpl(instance(), instance(), instance(), instance()),
  );
  instance.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
      instance(),
    ),
  );

  instance.registerLazySingleton<MomentRepository>(
    () => MomentRepositoryImpl(instance(), instance(), instance()),
  );
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<GoogleLoginUseCase>(
      () => GoogleLoginUseCase(instance()),
    );
    instance.registerFactory<FacebookLoginUseCase>(
      () => FacebookLoginUseCase(instance()),
    );
    instance.registerFactory<LoginViewModel>(
      () => LoginViewModel(instance(), instance(), instance()),
    );
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
      () => RegisterUseCase(instance()),
    );
    instance.registerFactory<RegisterViewModel>(
      () => RegisterViewModel(instance(), instance(), instance()),
    );
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(instance()),
    );
    instance.registerFactory<ForgotPasswordViewModel>(
      () => ForgotPasswordViewModel(instance()),
    );
  }
}

initVerifyEmailModule() {
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<ForgotPasswordUseCase>()) {
    getIt.registerFactory<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(getIt()),
    );
  }

  if (!getIt.isRegistered<VerifyForgotPasswordUseCase>()) {
    getIt.registerFactory<VerifyForgotPasswordUseCase>(
      () => VerifyForgotPasswordUseCase(getIt()),
    );
  }

  if (!getIt.isRegistered<VerifyEmailUseCase>()) {
    getIt.registerFactory<VerifyEmailUseCase>(
      () => VerifyEmailUseCase(getIt()),
    );
  }

  if (!getIt.isRegistered<ResendVerifyEmailUseCase>()) {
    getIt.registerFactory<ResendVerifyEmailUseCase>(
      () => ResendVerifyEmailUseCase(getIt()),
    );
  }

  if (!getIt.isRegistered<VerifyEmailViewModel>()) {
    getIt.registerFactory<VerifyEmailViewModel>(
      () => VerifyEmailViewModel(
        getIt<ForgotPasswordUseCase>(),
        getIt<VerifyForgotPasswordUseCase>(),
        getIt<VerifyEmailUseCase>(),
        getIt<ResendVerifyEmailUseCase>(),
      ),
    );
  }
}

initResetPasswordModule() {
  if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.registerFactory<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(instance()),
    );
    instance.registerFactory<ResetPasswordViewModel>(
      () => ResetPasswordViewModel(instance()),
    );
  }
}

initLanguageSelectionModule() {
  if (!GetIt.I.isRegistered<LanguageSelectionViewModel>()) {
    instance.registerFactory<LanguageSelectionViewModel>(
      () => LanguageSelectionViewModel(instance()),
    );
  }
}

initInitialSyncModule() {
  if (!GetIt.I.isRegistered<InitialSyncUseCase>()) {
    instance.registerFactory<InitialSyncUseCase>(
      () => InitialSyncUseCase(instance(), instance(), instance(), instance()),
    );
    instance.registerFactory<InitialSyncViewModel>(
      () => InitialSyncViewModel(instance(), instance()),
    );
  }
}

initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileViewModel>()) {
    instance.registerFactory<GetUserProfileUseCase>(
      () => GetUserProfileUseCase(instance()),
    );
    instance.registerFactory<LogoutUseCase>(() => LogoutUseCase(instance()));
    instance.registerFactory<ProfileViewModel>(
      () => ProfileViewModel(instance(), instance()),
    );
  }
}

initAppSettingsModule() {
  if (!GetIt.I.isRegistered<AppSettingsViewModel>()) {
    instance.registerFactory<GetLatestSyncUseCase>(
      () => GetLatestSyncUseCase(instance()),
    );
    instance.registerFactory<AppSettingsViewModel>(
      () => AppSettingsViewModel(instance(), instance()),
    );
  }
}
