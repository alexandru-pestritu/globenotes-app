import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordViewModel _viewModel =
      instance<ForgotPasswordViewModel>();

  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();

    _emailController.addListener(
      () => _viewModel.setEmail(_emailController.text),
    );

    _viewModel.isUserForgotPasswordSuccessfulStreamController.stream.listen((
      isForgotPasswordSuccessful,
    ) {
      if (isForgotPasswordSuccessful) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(
            Routes.verifyEmailRoute,
            arguments: {
              "email": _viewModel.forgotPasswordObject.email,
              "flow": "forgotPassword",
            },
          );
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
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
            ),
            centerTitle: true,
            title: Text(
              AppStrings.forgot,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body:
              (flowState?.getScreenWidget(context, _getContentWidget(), () {
                _viewModel.forgotPassword();
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
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: SvgPicture.asset(
                    ImageAssets.forgotPasswordIllustration,
                    width: AppSize.s250,
                    height: AppSize.s300,
                  ),
                ),
              ),

              Text(
                AppStrings.forgotTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: AppSize.s15),
              Text(
                AppStrings.forgotSubTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: AppSize.s40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.enterYourEmail,
                  style: textTheme.titleSmall,
                ),
              ),
              SizedBox(height: AppSize.s8),

              StreamBuilder<bool>(
                stream: _viewModel.outputEmailIcon,
                builder: (context, snapshot) {
                  bool showIcon = snapshot.data ?? false;
                  return TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: AppStrings.email,
                      suffixIcon: Icon(
                        Icons.check_circle,
                        size: AppSize.s18,
                        color:
                            showIcon ? ColorManager.primary : ColorManager.grey,
                      ),
                    ),
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
                          isAllValid ? () => _viewModel.forgotPassword() : null,
                      child: Text(AppStrings.sendOtpCode),
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
