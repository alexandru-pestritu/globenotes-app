import 'dart:io';
import 'package:country_flags/country_flags.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globenotes/app/constants.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/presentation/profile/profile_viewmodel.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/font_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = instance<ProfileViewModel>();
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        final flowState = snapshot.data;
        return Scaffold(
          body:
              flowState?.getScreenWidget(
                context,
                _getContentWidget(),
                () => _viewModel.fetchUserProfile(),
              ) ??
              _getContentWidget(),
        );
      },
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<UserProfile?>(
      stream: _viewModel.outputUserProfile,
      builder: (context, snapshot) {
        final userProfile = snapshot.data;
        if (userProfile == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildProfileLayout(userProfile);
      },
    );
  }

  Widget _buildProfileLayout(UserProfile profile) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final coverPath = profile.coverLocalFilePath;
    final profilePath = profile.profileLocalFilePath;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        final screenHeight = constraints.maxHeight;
        final coverHeight = screenHeight * 0.35;
        final avatarSize = AppSize.s100;

        return Stack(
          children: [
            Positioned(
              top: AppSize.s0,
              left: AppSize.s0,
              right: AppSize.s0,
              height: coverHeight,
              child: Container(
                color: ColorManager.primary,
                child:
                    (coverPath == null || coverPath.isEmpty)
                        ? Container(
                          decoration: BoxDecoration(
                            gradient:
                                isDark
                                    ? ColorManager.coverDarkGradient
                                    : ColorManager.coverLightGradient,
                          ),
                          child: Center(child: _buildPickCoverButton()),
                        )
                        : Image.file(File(coverPath), fit: BoxFit.cover),
              ),
            ),

            Positioned(
              top: coverHeight,
              left: AppSize.s0,
              right: AppSize.s0,
              bottom: AppSize.s0,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),

            Positioned(
              top: coverHeight - (avatarSize / AppSize.s1_5),
              left: AppSize.s0,
              right: AppSize.s0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorManager.white,
                      width: AppSize.s3,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: avatarSize / AppSize.s2,
                    backgroundColor: Colors.white,
                    foregroundImage:
                        (profilePath != null && profilePath.isNotEmpty)
                            ? FileImage(File(profilePath))
                            : AssetImage(ImageAssets.defaultAvatar),
                  ),
                ),
              ),
            ),

            Positioned(
              top: coverHeight + (avatarSize / AppSize.s4),
              left: AppSize.s0,
              right: AppSize.s0,
              bottom: AppSize.s0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      profile.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: AppSize.s8),

                    if (profile.location != null)
                      _buildLocationRow(profile.location!),
                    if (profile.location != null)
                      const SizedBox(height: AppSize.s8),

                    _buildBio(profile.bio),
                    const SizedBox(height: AppSize.s16),

                    _buildMenuItems(),

                    const SizedBox(height: AppSize.s16),

                    Text(
                      Constants.appVersion,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: AppSize.s10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (ctx) => DriftDbViewer(instance<AppDatabase>()),
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.debug.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPickCoverButton() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p6,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            IconAssets.camera,
            width: AppSize.s15,
            height: AppSize.s15,
          ),
          SizedBox(width: AppSize.s8),
          Text(
            AppStrings.pickCoverPhoto.tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: FontSize.s12,
              color: isDark ? Colors.white : ColorManager.darkGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationRow(Location location) {
    final city = location.city ?? "";
    final countryName = location.country.name;
    final isoCode = location.country.isoCode ?? "";
    final locationText = city.isNotEmpty ? "$city, $countryName" : countryName;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(locationText, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: AppSize.s6),
        if (isoCode.isNotEmpty)
          CountryFlag.fromCountryCode(
            isoCode.toUpperCase(),
            height: AppSize.s16,
            width: AppSize.s16,
            shape: Circle(),
          ),
      ],
    );
  }

  Widget _buildBio(String? bio) {
    if (bio == null || bio.isEmpty) {
      return Text(
        AppStrings.writeAboutYou.tr(),
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: ColorManager.primary),
        textAlign: TextAlign.center,
      );
    } else {
      final truncated = (bio.length > 30) ? "${bio.substring(0, 30)}..." : bio;
      return Text(
        truncated,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _buildMenuItems() {
    return Column(
      children: [
        _buildMenuItem(
          icon: IconAssets.edit,
          label: AppStrings.editProfile.tr(),
          onTap: _handleEditProfile,
        ),
        const SizedBox(height: AppSize.s10),

        _buildMenuItem(
          icon: IconAssets.user,
          label: AppStrings.account.tr(),
          onTap: _handleAccount,
        ),
        const SizedBox(height: AppSize.s10),

        _buildMenuItem(
          icon: IconAssets.notifications,
          label: AppStrings.notifications.tr(),
          onTap: _handleNotifications,
        ),
        const SizedBox(height: AppSize.s10),

        _buildMenuItem(
          icon: IconAssets.settings,
          label: AppStrings.appSettings.tr(),
          onTap: _handleAppSettings,
        ),
        const SizedBox(height: AppSize.s10),

        _buildMenuItem(
          icon: IconAssets.logout,
          label: AppStrings.logOut.tr(),
          onTap: _handleLogout,
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          border: Border.all(
            width: AppSize.s1_5,
            color: isDark ? Colors.grey[800]! : ColorManager.lightGrey,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                ColorManager.primary,
                BlendMode.srcIn,
              ),
              width: AppSize.s20,
              height: AppSize.s20,
            ),
            const SizedBox(width: AppSize.s12),
            Text(label, style: Theme.of(context).textTheme.titleSmall),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: AppSize.s16),
          ],
        ),
      ),
    );
  }

  void _handleEditProfile() {}

  void _handleAccount() {}

  void _handleNotifications() {}

  void _handleAppSettings() {}

  void _handleLogout() {
    _viewModel.inputState.add(
      ConfirmActionState(
        title: AppStrings.confirmLogoutTitle.tr(),
        message: AppStrings.confirmLogoutMessage.tr(),
        confirmText: AppStrings.logOut.tr(),
        denyText: AppStrings.cancel.tr(),
        confirmAction: () {
          _viewModel.logout();
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
        },
        denyAction: () {
          _viewModel.inputState.add(ContentState());
        },
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
