import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/register/register_viewmodel.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();

    _nameController.addListener(() => _viewModel.setName(_nameController.text));
    _emailController.addListener(
      () => _viewModel.setEmail(_emailController.text),
    );
    _passwordController.addListener(
      () => _viewModel.setPassword(_passwordController.text),
    );

    _viewModel.isUserRegisteredSuccessfullyStreamController.stream.listen((
      isRegisteredSuccessfully,
    ) {
      if (isRegisteredSuccessfully) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(
            Routes.verifyEmailRoute,
            arguments: {
              RouteParameter.email: _viewModel.registerObject.email,
              RouteParameter.flow: VerifyFlowType.register,
            },
          );
        });
      }
    });

    _viewModel.isUserSocialRegisterSuccessfulStreamController.stream.listen((
      isSocialRegisterSuccessful,
    ) {
      if (isSocialRegisterSuccessful) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
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
              AppStrings.signUp,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: AppPadding.p12),
                child: TextButton(
                  onPressed: () {
                    // TODO: switch language
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(80, AppSize.s16),
                    splashFactory: NoSplash.splashFactory,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      side: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  child: Text(
                    AppStrings.english,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body:
              (flowState?.getScreenWidget(context, _getContentWidget(), () {
                _viewModel.register();
              })) ??
              _getContentWidget(),
        );
      },
    );
  }

  Widget _getContentWidget() {
    final textTheme = Theme.of(context).textTheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final AssetImage logoImage =
        isDark
            ? const AssetImage(ImageAssets.logoHorizontalDark)
            : const AssetImage(ImageAssets.logoHorizontal);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p28,
          vertical: AppPadding.p28,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: logoImage,
                width: AppSize.s360,
                height: AppSize.s100,
              ),
              SizedBox(height: AppSize.s28),

              Text(AppStrings.enterYourName, style: textTheme.titleSmall),
              SizedBox(height: AppSize.s8),

              StreamBuilder<bool>(
                stream: _viewModel.outputNameIcon,
                builder: (context, snapshot) {
                  bool showIcon = snapshot.data ?? false;
                  return TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: AppStrings.name,
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
              SizedBox(height: AppSize.s16),

              Text(AppStrings.enterYourEmail, style: textTheme.titleSmall),
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
              SizedBox(height: AppSize.s16),

              Text(AppStrings.enterYourPassword, style: textTheme.titleSmall),
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
                          hintText: AppStrings.password,
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
                          isAllValid ? () => _viewModel.register() : null,
                      child: Text(AppStrings.register),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSize.s16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: textTheme.bodyMedium,
                  ),
                  SizedBox(width: AppSize.s4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginRoute,
                      );
                    },
                    child: Text(
                      AppStrings.signIn,
                      style: textTheme.titleSmall?.copyWith(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
                    child: Text(
                      AppStrings.or,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s16),

              SizedBox(
                width: double.infinity,
                height: AppSize.s45,
                child: OutlinedButton.icon(
                  icon: SvgPicture.asset(
                    ImageAssets.googleIcon,
                    width: AppSize.s20,
                    height: AppSize.s20,
                  ),
                  label: Text(
                    AppStrings.continueWithGoogle,
                    style: textTheme.titleSmall,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    side: BorderSide(color: ColorManager.lightGrey),
                  ),
                  onPressed: () {
                    _viewModel.loginWithGoogle();
                  },
                ),
              ),
              SizedBox(height: AppSize.s16),

              SizedBox(
                width: double.infinity,
                height: AppSize.s45,
                child: OutlinedButton.icon(
                  icon: SvgPicture.asset(
                    ImageAssets.facebookIcon,
                    width: AppSize.s20,
                    height: AppSize.s20,
                  ),
                  label: Text(
                    AppStrings.continueWithFacebook,
                    style: textTheme.titleSmall,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    side: BorderSide(color: ColorManager.lightGrey),
                  ),
                  onPressed: () {
                    _viewModel.loginWithFacebook();
                  },
                ),
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
