import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/reset_password/reset_password_viewmodel.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class ResetPasswordView extends StatefulWidget {
  final String email;
  final String code;

  const ResetPasswordView({super.key, required this.email, required this.code});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final ResetPasswordViewModel _viewModel = instance<ResetPasswordViewModel>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();
    _viewModel.init(widget.email, widget.code);

    _passwordController.addListener(
      () => _viewModel.setPassword(_passwordController.text),
    );

    _confirmPasswordController.addListener(
      () => _viewModel.setConfirmPassword(_confirmPasswordController.text),
    );

    _viewModel.isResetPasswordSuccessfulStreamController.stream.listen((
      isResetPasswordSuccessful,
    ) {
      if (isResetPasswordSuccessful) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        FlowState? flowState = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.forgotPasswordRoute,
                );
              },
            ),
            centerTitle: true,
            title: Text(
              AppStrings.reset.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body:
              (flowState?.getScreenWidget(context, _getContentWidget(), () {
                _viewModel.resetPassword();
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: SvgPicture.asset(
                    ImageAssets.resetPasswordIllustration,
                    width: AppSize.s200,
                    height: AppSize.s250,
                  ),
                ),
              ),
              SizedBox(height: AppSize.s40),
              Text(
                AppStrings.resetPasswordTitle.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: AppSize.s15),
              Text(
                AppStrings.resetPasswordSubtitle.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: AppSize.s40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.enterNewPassword.tr(),
                  style: textTheme.titleSmall,
                ),
              ),
              SizedBox(height: AppSize.s8),

              StreamBuilder<bool>(
                stream: _viewModel.outputIsPasswordValid,
                builder: (context, passwordSnapshot) {
                  return StreamBuilder<bool>(
                    stream: _viewModel.outputPasswordVisibility,
                    builder: (context, visibilitySnapshot) {
                      bool isValid = passwordSnapshot.data ?? false;
                      bool isHidden = visibilitySnapshot.data ?? true;
                      return TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          hintText: AppStrings.newPassword.tr(),
                          suffixIcon: IconButton(
                            iconSize: AppSize.s18,
                            icon: Icon(
                              isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color:
                                  isValid
                                      ? ColorManager.primary
                                      : ColorManager.grey,
                            ),
                            onPressed: () {
                              _viewModel.togglePasswordVisibility();
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: AppSize.s16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.confirmNewPassword.tr(),
                  style: textTheme.titleSmall,
                ),
              ),
              SizedBox(height: AppSize.s8),

              StreamBuilder<bool>(
                stream: _viewModel.outputIsConfirmPasswordValid,
                builder: (context, passwordSnapshot) {
                  return StreamBuilder<bool>(
                    stream: _viewModel.outputConfirmPasswordVisibility,
                    builder: (context, visibilitySnapshot) {
                      bool isValid = passwordSnapshot.data ?? false;
                      bool isHidden = visibilitySnapshot.data ?? true;
                      return TextFormField(
                        controller: _confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          hintText: AppStrings.confirmPassword.tr(),
                          suffixIcon: IconButton(
                            iconSize: AppSize.s18,
                            icon: Icon(
                              isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color:
                                  isValid
                                      ? ColorManager.primary
                                      : ColorManager.grey,
                            ),
                            onPressed: () {
                              _viewModel.toggleConfirmPasswordVisibility();
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: AppSize.s20),

              StreamBuilder<bool>(
                stream: _viewModel.outputIsAllInputsValid,
                builder: (context, snapshot) {
                  bool isAllValid = snapshot.data ?? false;
                  return SizedBox(
                    width: double.infinity,
                    height: AppSize.s45,
                    child: ElevatedButton(
                      onPressed:
                          isAllValid ? () => _viewModel.resetPassword() : null,
                      child: Text(AppStrings.change.tr()),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSize.s16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
