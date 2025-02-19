import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:globenotes/app/app_preferences.dart';
import 'package:globenotes/data/data_source/remote_data_source.dart';
import 'package:globenotes/data/network/app_api.dart';
import 'package:globenotes/data/network/dio_factory.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/data/repository/repository_impl.dart';
import 'package:globenotes/domain/repository/repository.dart';
import 'package:globenotes/domain/usecase/forgot_password_usecase.dart';
import 'package:globenotes/domain/usecase/login_usecase.dart';
import 'package:globenotes/domain/usecase/register_usecase.dart';
import 'package:globenotes/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:globenotes/presentation/login/login_viewmodel.dart';
import 'package:globenotes/presentation/register/register_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared preferences instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app preferences instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance()),
  );

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(Connectivity()),
  );

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(instance()),
  );

  // repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(instance(), instance()),
  );
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
      () => RegisterUseCase(instance()),
    );
    instance.registerFactory<RegisterViewModel>(
      () => RegisterViewModel(instance()),
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
