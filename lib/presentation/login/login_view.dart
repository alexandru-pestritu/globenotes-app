import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/login/login_viewmodel.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();
    _emailController.addListener(
      () => _viewModel.setEmail(_emailController.text),
    );
    _passwordController.addListener(
      () => _viewModel.setPassword(_passwordController.text),
    );
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AssetImage logoImage =
        isDark
            ? const AssetImage(ImageAssets.logoHorizontalDark)
            : const AssetImage(ImageAssets.logoHorizontal);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          },
        ),
        centerTitle: true,
        title: Text(AppStrings.login, style: textTheme.titleLarge),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppPadding.p12),
            child: TextButton(
              onPressed: () {
                //TODO: Change language
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
                style: textTheme.titleSmall?.copyWith(
                  color: ColorManager.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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

                Text(AppStrings.enterYourEmail, style: textTheme.titleSmall),
                SizedBox(height: AppSize.s8),

                StreamBuilder<bool>(
                  stream: _viewModel.outputEmailIcon,
                  builder: (context, snapshot) {
                    return Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: AppStrings.email,
                            suffixIcon: StreamBuilder<bool>(
                              stream: _viewModel.outputEmailIcon,
                              builder: (context, snapshot) {
                                bool isValid = snapshot.data ?? false;
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: AppPadding.p0,
                                  ),
                                  child: Icon(
                                    Icons.check_circle,
                                    size: AppSize.s18,
                                    color:
                                        isValid
                                            ? ColorManager.primary
                                            : ColorManager.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s45,
                      child: ElevatedButton(
                        onPressed:
                            (snapshot.data ?? false)
                                ? () {
                                  _viewModel.login();
                                }
                                : null,
                        child: Text(AppStrings.login),
                      ),
                    );
                  },
                ),
                SizedBox(height: AppSize.s16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
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
                        AppStrings.signUp,
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
                      // TODO: Google sign-in
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
                      // TODO: Facebook sign-in
                    },
                  ),
                ),
                SizedBox(height: AppSize.s16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.forgotPasswordRoute,
                        );
                      },
                      child: Text(
                        AppStrings.forgetPassword,
                        style: textTheme.titleSmall?.copyWith(
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
