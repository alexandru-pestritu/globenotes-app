import 'dart:async';
import 'package:globenotes/domain/usecase/base_usecase.dart';
import 'package:globenotes/domain/usecase/auth/login_usecase.dart';
import 'package:globenotes/domain/usecase/auth/social_login_usecase.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/common/freezed_data_classes.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController<bool> _passwordVisibilityStreamController =
      StreamController<bool>.broadcast();

  final StreamController<bool> _emailIconStreamController =
      StreamController<bool>.broadcast();

  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  var loginObject = LoginObject("", "");

  bool _isPasswordHidden = true;

  final LoginUseCase _loginUseCase;
  final GoogleLoginUseCase _googleLoginUseCase;
  final FacebookLoginUseCase _facebookLoginUseCase;

  LoginViewModel(
    this._loginUseCase,
    this._googleLoginUseCase,
    this._facebookLoginUseCase,
  );

  @override
  void dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordVisibilityStreamController.close();
    _emailIconStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputPasswordVisibility => _passwordVisibilityStreamController.sink;

  @override
  Sink get inputEmailIcon => _emailIconStreamController.sink;

  @override
  login() async {
    inputState.add(LoadingState());
    (await _loginUseCase.execute(
      LoginUseCaseInput(loginObject.email, loginObject.password),
    )).fold(
      (failure) => {
        inputState.add(
          ErrorState(StateRendererType.snackbarErrorState, failure.message),
        ),
      },
      (data) {
        inputState.add(ContentState());
        isUserLoggedInSuccessfullyStreamController.add(true);
      },
    );
  }

  @override
  loginWithGoogle() async {
    inputState.add(LoadingState());

    (await _googleLoginUseCase.execute(const NoParams())).fold(
      (failure) {
        inputState.add(
          ErrorState(StateRendererType.snackbarErrorState, failure.message),
        );
      },
      (authData) {
        inputState.add(ContentState());
        isUserLoggedInSuccessfullyStreamController.add(true);
      },
    );
  }

  @override
  loginWithFacebook() async {
    inputState.add(LoadingState());

    (await _facebookLoginUseCase.execute(const NoParams())).fold(
      (failure) {
        inputState.add(
          ErrorState(StateRendererType.snackbarErrorState, failure.message),
        );
      },
      (authData) {
        inputState.add(ContentState());
        isUserLoggedInSuccessfullyStreamController.add(true);
      },
    );
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    loginObject = loginObject.copyWith(email: email);
    inputEmailIcon.add(_isEmailValid(email));
    _validate();
  }

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  @override
  Stream<bool> get outputPasswordVisibility =>
      _passwordVisibilityStreamController.stream;

  @override
  Stream<bool> get outputEmailIcon => _emailIconStreamController.stream;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    inputPasswordVisibility.add(_isPasswordHidden);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isEmailValid(String email) {
    final RegExp emailRegex = RegExp(RegexValidation.emailRegex);
    return emailRegex.hasMatch(email);
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isEmailValid(loginObject.email);
  }
}

mixin LoginViewModelInputs {
  setEmail(String email);

  setPassword(String password);

  login();
  loginWithGoogle();
  loginWithFacebook();

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputIsAllInputValid;

  Sink get inputPasswordVisibility;

  Sink get inputEmailIcon;
}

mixin LoginViewModelOutputs {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;

  Stream<bool> get outputPasswordVisibility;

  Stream<bool> get outputEmailIcon;
}
