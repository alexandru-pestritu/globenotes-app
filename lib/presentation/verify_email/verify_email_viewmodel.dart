import 'dart:async';
import 'package:globenotes/domain/usecase/forgot_password_usecase.dart';
import 'package:globenotes/domain/usecase/resend_verify_email_usecase.dart';
import 'package:globenotes/domain/usecase/verify_email_usecase.dart';
import 'package:globenotes/domain/usecase/verify_forgot_password_usecase.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/common/freezed_data_classes.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';

class VerifyEmailViewModel extends BaseViewModel
    with VerifyEmailViewModelInputs, VerifyEmailViewModelOutputs {
  final StreamController<String> _otpStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController<int> _resendCountDownStreamController =
      StreamController<int>.broadcast();

  final StreamController<bool> _isResendEnabledStreamController =
      StreamController<bool>.broadcast();

  final StreamController<Map<String, dynamic>> _onVerifySuccessController =
      StreamController<Map<String, dynamic>>.broadcast();

  late String _flow;

  var forgotPasswordObject = ForgotPasswordObject("");
  var verifyForgotPasswordObject = VerifyForgotPasswordObject("", "");
  var verifyEmailObject = VerifyEmailObject("", "");
  var resendVerifyEmailObject = ResendVerificationObject("");

  Timer? _resendTimer;
  bool _isResendEnabled = false;
  int _resendCountDown = 60;

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final VerifyForgotPasswordUseCase _verifyForgotPasswordUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final ResendVerifyEmailUseCase _resendVerifyEmailUseCase;

  VerifyEmailViewModel(
    this._forgotPasswordUseCase,
    this._verifyForgotPasswordUseCase,
    this._verifyEmailUseCase,
    this._resendVerifyEmailUseCase,
  );

  @override
  void start() {
    inputState.add(ContentState());
  }

  void init(String email, String flow) {
    _flow = flow;

    forgotPasswordObject = forgotPasswordObject.copyWith(email: email);
    verifyForgotPasswordObject = verifyForgotPasswordObject.copyWith(
      email: email,
      code: "",
    );
    verifyEmailObject = verifyEmailObject.copyWith(email: email, code: "");
    resendVerifyEmailObject = resendVerifyEmailObject.copyWith(email: email);

    _startResendTimer();
  }

  @override
  void dispose() {
    _otpStreamController.close();
    _isAllInputsValidStreamController.close();
    _resendCountDownStreamController.close();
    _isResendEnabledStreamController.close();
    _onVerifySuccessController.close();

    _resendTimer?.cancel();
    super.dispose();
  }

  @override
  Sink get inputOTP => _otpStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputResendCountDown => _resendCountDownStreamController.sink;

  @override
  Sink get inputIsResendEnabled => _isResendEnabledStreamController.sink;

  @override
  void setOtp(String otp) {
    if (_flow == "register") {
      verifyEmailObject = verifyEmailObject.copyWith(code: otp);
    } else {
      verifyForgotPasswordObject = verifyForgotPasswordObject.copyWith(
        code: otp,
      );
    }
    inputOTP.add(otp);
    _validate();
  }

  @override
  Future<void> verify() async {
    inputState.add(LoadingState());

    if (_flow == "register") {
      (await _verifyEmailUseCase.execute(
        VerifyEmailUseCaseInput(
          verifyEmailObject.email,
          verifyEmailObject.code,
        ),
      )).fold(
        (failure) {
          inputState.add(
            ErrorState(StateRendererType.snackbarErrorState, failure.message),
          );
        },
        (success) {
          inputState.add(ContentState());
          _onVerifySuccessController.add({
            "flow": "register",
            "email": verifyEmailObject.email,
          });
        },
      );
    } else {
      (await _verifyForgotPasswordUseCase.execute(
        VerifyForgotPasswordUseCaseInput(
          verifyForgotPasswordObject.email,
          verifyForgotPasswordObject.code,
        ),
      )).fold(
        (failure) {
          inputState.add(
            ErrorState(StateRendererType.snackbarErrorState, failure.message),
          );
        },
        (success) {
          inputState.add(ContentState());
          _onVerifySuccessController.add({
            "flow": "forgotPassword",
            "email": verifyForgotPasswordObject.email,
            "code": verifyForgotPasswordObject.code,
          });
        },
      );
    }
  }

  @override
  Future<void> resendOTP() async {
    if (!_isResendEnabled) return;

    inputState.add(LoadingState());

    if (_flow == "register") {
      (await _resendVerifyEmailUseCase.execute(
        ResendVerifyEmailUseCaseInput(resendVerifyEmailObject.email),
      )).fold(
        (failure) {
          inputState.add(
            ErrorState(StateRendererType.snackbarErrorState, failure.message),
          );
        },
        (success) {
          inputState.add(ContentState());
          _startResendTimer();
        },
      );
    } else {
      (await _forgotPasswordUseCase.execute(
        ForgotPasswordUseCaseInput(forgotPasswordObject.email),
      )).fold(
        (failure) {
          inputState.add(
            ErrorState(StateRendererType.snackbarErrorState, failure.message),
          );
        },
        (data) {
          inputState.add(ContentState());
          _startResendTimer();
        },
      );
    }
  }

  @override
  Stream<bool> get outputIsOtpValid =>
      _otpStreamController.stream.map((otp) => _isOtpValid(otp));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  @override
  Stream<int> get outputResendCountDown =>
      _resendCountDownStreamController.stream;

  @override
  Stream<bool> get outputIsResendEnabled =>
      _isResendEnabledStreamController.stream;

  Stream<Map<String, dynamic>> get onVerifySuccessStream =>
      _onVerifySuccessController.stream;

  void _startResendTimer() {
    _isResendEnabled = false;
    inputIsResendEnabled.add(false);

    _resendTimer?.cancel();
    _resendCountDown = 60;
    inputResendCountDown.add(_resendCountDown);

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _resendCountDown--;
      inputResendCountDown.add(_resendCountDown);

      if (_resendCountDown <= 0) {
        timer.cancel();
        _isResendEnabled = true;
        inputIsResendEnabled.add(true);
      }
    });
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isOtpValid(String otp) => otp.length == 4;

  bool _isAllInputsValid() {
    if (_flow == "register") {
      return _isOtpValid(verifyEmailObject.code);
    } else {
      return _isOtpValid(verifyForgotPasswordObject.code);
    }
  }
}

mixin VerifyEmailViewModelInputs {
  void setOtp(String otp);
  Future<void> verify();
  Future<void> resendOTP();

  Sink get inputOTP;
  Sink get inputIsAllInputValid;
  Sink get inputResendCountDown;
  Sink get inputIsResendEnabled;
}

mixin VerifyEmailViewModelOutputs {
  Stream<bool> get outputIsOtpValid;
  Stream<bool> get outputIsAllInputsValid;
  Stream<int> get outputResendCountDown;
  Stream<bool> get outputIsResendEnabled;
}
