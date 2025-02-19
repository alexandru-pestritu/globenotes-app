import 'dart:async';
import 'package:globenotes/domain/usecase/forgot_password_usecase.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/common/freezed_data_classes.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController<bool> _emailIconStreamController =
      StreamController<bool>.broadcast();

  final StreamController isUserForgotPasswordSuccessfulStreamController =
      StreamController<bool>();

  var forgotPasswordObject = ForgotPasswordObject("");

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputsValidStreamController.close();
    _emailIconStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputEmailIcon => _emailIconStreamController.sink;

  @override
  forgotPassword() async {
    inputState.add(LoadingState());
    (await _forgotPasswordUseCase.execute(
      ForgotPasswordUseCaseInput(forgotPasswordObject.email),
    )).fold(
      (failure) => {
        inputState.add(
          ErrorState(StateRendererType.snackbarErrorState, failure.message),
        ),
      },
      (data) {
        inputState.add(ContentState());
        isUserForgotPasswordSuccessfulStreamController.add(true);
      },
    );
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    forgotPasswordObject = forgotPasswordObject.copyWith(email: email);
    inputEmailIcon.add(_isEmailValid(email));
    _validate();
  }

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  @override
  Stream<bool> get outputEmailIcon => _emailIconStreamController.stream;

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isEmailValid(String email) {
    final RegExp emailRegex = RegExp(RegexValidation.emailRegex);
    return emailRegex.hasMatch(email);
  }

  bool _isAllInputsValid() {
    return _isEmailValid(forgotPasswordObject.email);
  }
}

mixin ForgotPasswordViewModelInputs {
  setEmail(String email);

  forgotPassword();

  Sink get inputEmail;

  Sink get inputIsAllInputValid;

  Sink get inputEmailIcon;
}

mixin ForgotPasswordViewModelOutputs {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsAllInputsValid;

  Stream<bool> get outputEmailIcon;
}
