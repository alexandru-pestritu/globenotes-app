import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globenotes/presentation/home/home_page.dart';
import 'package:globenotes/presentation/journals/journals_page.dart';
import 'package:globenotes/presentation/moments/new_moment_page.dart';
import 'package:globenotes/presentation/notifications/notifications_page.dart';
import 'package:globenotes/presentation/profile/profile_page.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    JournalsPage(),
    NewMomentPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem({
    required String assetName,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: AppPadding.p3),
        child: SvgPicture.asset(
          assetName,
          colorFilter: ColorFilter.mode(
            isSelected ? ColorManager.primary : ColorManager.grey,
            BlendMode.srcIn,
          ),
          width: AppSize.s24,
          height: AppSize.s24,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorManager.grey, blurRadius: 0.1)],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: _onTap,

              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                _buildNavItem(
                  assetName: IconAssets.home,
                  label: AppStrings.home.tr(),
                  index: 0,
                ),
                _buildNavItem(
                  assetName: IconAssets.journal,
                  label: AppStrings.journals.tr(),
                  index: 1,
                ),
                _buildNavItem(
                  assetName: IconAssets.addCircle,
                  label: AppStrings.newMoment.tr(),
                  index: 2,
                ),
                _buildNavItem(
                  assetName: IconAssets.notifications,
                  label: AppStrings.notifications.tr(),
                  index: 3,
                ),
                _buildNavItem(
                  assetName: IconAssets.profile,
                  label: AppStrings.profile.tr(),
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
