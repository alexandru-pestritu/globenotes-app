import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/app/extensions.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';
import 'package:globenotes/presentation/verify_email/verify_email_viewmodel.dart';

class VerifyEmailView extends StatefulWidget {
  final String email;
  final String flow;

  const VerifyEmailView({super.key, required this.email, required this.flow});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  final VerifyEmailViewModel _viewModel = instance<VerifyEmailViewModel>();

  final TextEditingController _otp1Controller = TextEditingController();
  final TextEditingController _otp2Controller = TextEditingController();
  final TextEditingController _otp3Controller = TextEditingController();
  final TextEditingController _otp4Controller = TextEditingController();

  final FocusNode _fn1 = FocusNode();
  final FocusNode _fn2 = FocusNode();
  final FocusNode _fn3 = FocusNode();
  final FocusNode _fn4 = FocusNode();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  void _bind() {
    _viewModel.start();
    _viewModel.init(widget.email, widget.flow);

    _viewModel.onVerifySuccessStream.listen((event) {
      final flowType = event[RouteParameter.flow] as String;
      final emailArg = event[RouteParameter.email] as String;

      if (flowType == VerifyFlowType.register) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        });
      } else {
        final code = event[RouteParameter.code] as String;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(
            context,
            Routes.resetPasswordRoute,
            arguments: {
              RouteParameter.email: emailArg,
              RouteParameter.code: code,
            },
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _otp1Controller.dispose();
    _otp2Controller.dispose();
    _otp3Controller.dispose();
    _otp4Controller.dispose();

    _fn1.dispose();
    _fn2.dispose();
    _fn3.dispose();
    _fn4.dispose();

    _viewModel.dispose();
    super.dispose();
  }

  Widget _buildOTPFields() {
    void onFieldChanged(
      String value,
      TextEditingController controller,
      FocusNode currentFocus,
      FocusNode? nextFocus,
      FocusNode? previousFocus,
    ) {
      if (value.isNotEmpty) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          currentFocus.unfocus();
        }
      } else {
        if (previousFocus != null) {
          FocusScope.of(context).requestFocus(previousFocus);
        }
      }

      final otp =
          _otp1Controller.text +
          _otp2Controller.text +
          _otp3Controller.text +
          _otp4Controller.text;

      _viewModel.setOtp(otp);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _singleOTPField(_otp1Controller, _fn1, _fn2, null, onFieldChanged),
        _singleOTPField(_otp2Controller, _fn2, _fn3, _fn1, onFieldChanged),
        _singleOTPField(_otp3Controller, _fn3, _fn4, _fn2, onFieldChanged),
        _singleOTPField(_otp4Controller, _fn4, null, _fn3, onFieldChanged),
      ],
    );
  }

  Widget _singleOTPField(
    TextEditingController controller,
    FocusNode currentFocus,
    FocusNode? nextFocus,
    FocusNode? previousFocus,
    void Function(
      String,
      TextEditingController,
      FocusNode,
      FocusNode?,
      FocusNode?,
    )
    onChanged,
  ) {
    return SizedBox(
      width: AppSize.s65,
      height: AppSize.s50,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headlineLarge,
        onChanged:
            (val) => onChanged(
              val,
              controller,
              currentFocus,
              nextFocus,
              previousFocus,
            ),
        decoration: InputDecoration(
          counterText: empty,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(
            AppPadding.p12,
            AppPadding.p8,
            AppPadding.p8,
            AppPadding.p8,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        final flowState = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (widget.flow == VerifyFlowType.register) {
                  Navigator.pushReplacementNamed(context, Routes.registerRoute);
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.forgotPasswordRoute,
                  );
                }
              },
            ),
            centerTitle: true,
            title: Text(
              AppStrings.verify,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body:
              (flowState?.getScreenWidget(context, _getContentWidget(), () {
                _viewModel.verify();
              })) ??
              _getContentWidget(),
        );
      },
    );
  }

  Widget _getContentWidget() {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p28,
          vertical: AppPadding.p28,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: SvgPicture.asset(
                  ImageAssets.verifyEmailIllustration,
                  width: AppSize.s200,
                  height: AppSize.s250,
                ),
              ),
            ),
            SizedBox(height: AppSize.s40),
            Text(
              AppStrings.verifyEmailTitle,
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge,
            ),
            SizedBox(height: AppSize.s20),
            Text(
              AppStrings.verifyEmailSubtitle,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
            SizedBox(height: AppSize.s8),
            Text(
              widget.email,
              textAlign: TextAlign.center,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSize.s40),

            _buildOTPFields(),
            SizedBox(height: AppSize.s20),

            StreamBuilder<bool>(
              stream: _viewModel.outputIsAllInputsValid,
              builder: (context, snapshot) {
                bool isAllValid = snapshot.data ?? false;
                return SizedBox(
                  width: double.infinity,
                  height: AppSize.s45,
                  child: ElevatedButton(
                    onPressed: isAllValid ? () => _viewModel.verify() : null,
                    child: Text(AppStrings.sendOtpCode),
                  ),
                );
              },
            ),
            SizedBox(height: AppSize.s16),

            StreamBuilder<int>(
              stream: _viewModel.outputResendCountDown,
              builder: (context, snapshot) {
                final secondsLeft = snapshot.data ?? 60;
                return StreamBuilder<bool>(
                  stream: _viewModel.outputIsResendEnabled,
                  builder: (context, snapshot2) {
                    final isEnabled = snapshot2.data ?? false;
                    if (isEnabled) {
                      return GestureDetector(
                        onTap: () => _viewModel.resendOTP(),
                        child: Text(
                          AppStrings.resendOTP,
                          style: textTheme.titleSmall?.copyWith(
                            color: ColorManager.primary,
                          ),
                        ),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.resendOTP,
                            style: textTheme.bodyMedium,
                          ),
                          SizedBox(width: AppSize.s4),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.registerRoute,
                              );
                            },
                            child: Text(
                              "(00:$secondsLeft)",
                              style: textTheme.titleSmall?.copyWith(
                                color: ColorManager.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
