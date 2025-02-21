import 'dart:async';
import 'package:globenotes/domain/usecase/base_usecase.dart';
import 'package:globenotes/domain/usecase/register_usecase.dart';
import 'package:globenotes/domain/usecase/social_login_usecase.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/common/freezed_data_classes.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  final StreamController _nameStreamController =
      StreamController<String>.broadcast();

  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController<bool> _passwordVisibilityStreamController =
      StreamController<bool>.broadcast();

  final StreamController<bool> _nameIconStreamController =
      StreamController<bool>.broadcast();

  final StreamController<bool> _emailIconStreamController =
      StreamController<bool>.broadcast();

  final StreamController isUserRegisteredSuccessfullyStreamController =
      StreamController<bool>();

  final StreamController isUserSocialRegisterSuccessfulStreamController =
      StreamController<bool>();

  var registerObject = RegisterObject("", "", "");

  bool _isPasswordHidden = true;

  final RegisterUseCase _registerUseCase;
  final GoogleLoginUseCase _googleLoginUseCase;
  final FacebookLoginUseCase _facebookLoginUseCase;

  RegisterViewModel(
    this._registerUseCase,
    this._googleLoginUseCase,
    this._facebookLoginUseCase,
  );

  @override
  void dispose() {
    _nameStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordVisibilityStreamController.close();
    _nameIconStreamController.close();
    _emailIconStreamController.close();
    isUserRegisteredSuccessfullyStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputPasswordVisibility => _passwordVisibilityStreamController.sink;

  @override
  Sink get inputNameIcon => _nameIconStreamController.sink;

  @override
  Sink get inputEmailIcon => _emailIconStreamController.sink;

  @override
  register() async {
    inputState.add(LoadingState());
    (await _registerUseCase.execute(
      RegisterUseCaseInput(
        registerObject.email,
        registerObject.password,
        registerObject.name,
      ),
    )).fold(
      (failure) => {
        inputState.add(
          ErrorState(StateRendererType.snackbarErrorState, failure.message),
        ),
      },
      (data) {
        inputState.add(ContentState());
        isUserRegisteredSuccessfullyStreamController.add(true);
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
        isUserSocialRegisterSuccessfulStreamController.add(true);
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
        isUserSocialRegisterSuccessfulStreamController.add(true);
      },
    );
  }

  @override
  setName(String name) {
    inputName.add(name);
    registerObject = registerObject.copyWith(name: name);
    inputNameIcon.add(_isNameValid(name));
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    registerObject = registerObject.copyWith(password: password);
    _validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    registerObject = registerObject.copyWith(email: email);
    inputEmailIcon.add(_isEmailValid(email));
    _validate();
  }

  @override
  Stream<bool> get outputIsNameValid =>
      _nameStreamController.stream.map((name) => _isNameValid(name));

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
  Stream<bool> get outputNameIcon => _nameIconStreamController.stream;

  @override
  Stream<bool> get outputEmailIcon => _emailIconStreamController.stream;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    inputPasswordVisibility.add(_isPasswordHidden);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isNameValid(String name) {
    return name.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty && password.length >= 8;
  }

  bool _isEmailValid(String email) {
    final RegExp emailRegex = RegExp(RegexValidation.emailRegex);
    return emailRegex.hasMatch(email);
  }

  bool _isAllInputsValid() {
    return _isNameValid(registerObject.name) &&
        _isPasswordValid(registerObject.password) &&
        _isEmailValid(registerObject.email);
  }
}

mixin RegisterViewModelInputs {
  setName(String name);

  setEmail(String email);

  setPassword(String password);

  register();
  loginWithGoogle();
  loginWithFacebook();

  Sink get inputName;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputIsAllInputValid;

  Sink get inputPasswordVisibility;

  Sink get inputNameIcon;

  Sink get inputEmailIcon;
}

mixin RegisterViewModelOutputs {
  Stream<bool> get outputIsNameValid;

  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;

  Stream<bool> get outputPasswordVisibility;

  Stream<bool> get outputNameIcon;

  Stream<bool> get outputEmailIcon;
}
