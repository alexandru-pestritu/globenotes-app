import 'dart:async';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/settings/language_selection/language_selection_viewmodel.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/language_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';
import 'package:country_flags/country_flags.dart';

class LanguageSelectionView extends StatefulWidget {
  const LanguageSelectionView({super.key});

  @override
  State<LanguageSelectionView> createState() => _LanguageSelectionViewState();
}

class _LanguageSelectionViewState extends State<LanguageSelectionView> {
  late final LanguageSelectionViewModel _viewModel;
  late final StreamSubscription<Locale> _localeSubscription;

  Locale _currentLocale = AppLanguages.english;

  @override
  void initState() {
    super.initState();
    _viewModel = instance<LanguageSelectionViewModel>();
    _viewModel.start();

    _localeSubscription = _viewModel.selectedLanguageStream.listen((locale) {
      if (!mounted) return;

      setState(() {
        _currentLocale = locale;
      });

      context.setLocale(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.languageTitle.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: AppLanguages.languageList.length,
        itemBuilder: (context, index) {
          final language = AppLanguages.languageList[index];
          final isSelected = _currentLocale == language.locale;

          return GestureDetector(
            onTap: () {
              _viewModel.changeLanguage(language.locale);
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppMargin.m16,
                vertical: AppMargin.m8,
              ),
              padding: EdgeInsets.all(AppPadding.p12),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border:
                    isSelected
                        ? Border.all(
                          color: ColorManager.primary,
                          width: AppSize.s2,
                        )
                        : Border.all(
                          color:
                              isDark
                                  ? Colors.grey[850]!
                                  : ColorManager.lightGrey,
                        ),
              ),
              child: Row(
                children: [
                  CountryFlag.fromCountryCode(
                    language.languageCode.toUpperCase(),
                    height: AppSize.s24,
                    width: AppSize.s32,
                    shape: Circle(),
                  ),
                  SizedBox(width: AppSize.s12),
                  Text(
                    language.translationKey.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  if (isSelected)
                    Icon(Icons.check_circle, color: ColorManager.primary),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _localeSubscription.cancel();
    _viewModel.dispose();
    super.dispose();
  }
}
