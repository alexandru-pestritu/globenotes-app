import 'dart:async';
import 'package:globenotes/domain/usecase/reset_password_usecase.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/common/freezed_data_classes.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';

class ResetPasswordViewModel extends BaseViewModel
    with ResetPasswordViewModelInputs, ResetPasswordViewModelOutputs {
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController<bool> _passwordVisibilityStreamController =
      StreamController<bool>.broadcast();

  final StreamController _confirmPasswordStreamController =
      StreamController<String>.broadcast();

  final StreamController<bool> _confirmPasswordVisibilityStreamController =
      StreamController<bool>.broadcast();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isResetPasswordSuccessfulStreamController =
      StreamController<bool>();

  var resetPasswordObject = ResetPasswordObject("", "", "", "");

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordViewModel(this._resetPasswordUseCase);

  @override
  void dispose() {
    _passwordStreamController.close();
    _passwordVisibilityStreamController.close();
    _confirmPasswordStreamController.close();
    _confirmPasswordVisibilityStreamController.close();
    _isAllInputsValidStreamController.close();
    isResetPasswordSuccessfulStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void init(String email, String code) {
    resetPasswordObject = resetPasswordObject.copyWith(
      email: email,
      code: code,
    );
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputPasswordVisibility => _passwordVisibilityStreamController.sink;

  @override
  Sink get inputConfirmPassword => _confirmPasswordStreamController.sink;

  @override
  Sink get inputConfirmPasswordVisibility =>
      _confirmPasswordVisibilityStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  resetPassword() async {
    inputState.add(LoadingState());
    (await _resetPasswordUseCase.execute(
      ResetPasswordUseCaseInput(
        resetPasswordObject.email,
        resetPasswordObject.code,
        resetPasswordObject.password,
      ),
    )).fold(
      (failure) => {
        inputState.add(
          ErrorState(StateRendererType.snackbarErrorState, failure.message),
        ),
      },
      (data) {
        inputState.add(ContentState());
        isResetPasswordSuccessfulStreamController.add(true);
      },
    );
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    resetPasswordObject = resetPasswordObject.copyWith(password: password);
    _validate();
  }

  @override
  setConfirmPassword(String confirmPassword) {
    inputConfirmPassword.add(confirmPassword);
    resetPasswordObject = resetPasswordObject.copyWith(
      confirmPassword: confirmPassword,
    );
    _validate();
  }

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputPasswordVisibility =>
      _passwordVisibilityStreamController.stream;

  @override
  Stream<bool> get outputIsConfirmPasswordValid =>
      _confirmPasswordStreamController.stream.map(
        (confirmPassword) => _isConfirmPasswordValid(confirmPassword),
      );

  @override
  Stream<bool> get outputConfirmPasswordVisibility =>
      _confirmPasswordVisibilityStreamController.stream;

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    inputPasswordVisibility.add(_isPasswordHidden);
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    inputConfirmPasswordVisibility.add(_isConfirmPasswordHidden);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.length >= 8;
  }

  bool _isConfirmPasswordValid(String confirmPassword) {
    return confirmPassword.length >= 8;
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(resetPasswordObject.password) &&
        _isConfirmPasswordValid(resetPasswordObject.confirmPassword) &&
        resetPasswordObject.password == resetPasswordObject.confirmPassword;
  }
}

mixin ResetPasswordViewModelInputs {
  void init(String email, String code);

  setPassword(String password);
  setConfirmPassword(String confirmPassword);

  resetPassword();

  Sink get inputPassword;
  Sink get inputPasswordVisibility;

  Sink get inputConfirmPassword;
  Sink get inputConfirmPasswordVisibility;

  Sink get inputIsAllInputValid;
}

mixin ResetPasswordViewModelOutputs {
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputPasswordVisibility;

  Stream<bool> get outputIsConfirmPasswordValid;
  Stream<bool> get outputConfirmPasswordVisibility;

  Stream<bool> get outputIsAllInputsValid;
}
