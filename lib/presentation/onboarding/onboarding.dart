import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
    SliderObject(
      AppStrings.onBoardingTitle1,
      AppStrings.onBoardingSubTitle1,
      ImageAssets.onboardingIllustration1,
    ),
    SliderObject(
      AppStrings.onBoardingTitle2,
      AppStrings.onBoardingSubTitle2,
      ImageAssets.onboardingIllustration2,
    ),
    SliderObject(
      AppStrings.onBoardingTitle3,
      AppStrings.onBoardingSubTitle3,
      ImageAssets.onboardingIllustration3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _list.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(_list[index]);
            },
          ),

          Positioned(
            top: AppSize.s40,
            right: AppSize.s10,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              child: Text(
                AppStrings.skip,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),

          Positioned(
            bottom: AppSize.s75,
            left: AppSize.s20,
            child: Row(
              children: List.generate(
                _list.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: DurationConstant.d300),
                  margin: EdgeInsets.symmetric(horizontal: AppSize.s5),
                  width: _currentIndex == index ? AppSize.s20 : AppSize.s8,
                  height: AppSize.s8,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == index
                            ? ColorManager.primary
                            : ColorManager.primaryOpacity10,
                    borderRadius: BorderRadius.circular(AppSize.s4),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: AppSize.s50,
            right: AppSize.s20,
            child: NextButtonWithProgress(
              progress: (_currentIndex + 1) / _list.length,
              onTap: () {
                if (_currentIndex == _list.length - 1) {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p24,
        vertical: AppPadding.p8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: SvgPicture.asset(
                _sliderObject.image,
                width: AppSize.s315,
                height: AppSize.s360,
              ),
            ),
          ),
          SizedBox(height: AppSize.s30),
          Text(
            _sliderObject.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: AppSize.s30),
          Text(
            _sliderObject.subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class NextButtonWithProgress extends StatelessWidget {
  final double progress;
  final VoidCallback onTap;

  const NextButtonWithProgress({
    super.key,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: AppSize.s65,
          height: AppSize.s65,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: AppSize.s5,
            backgroundColor: ColorManager.primaryOpacity10,
            valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primary),
          ),
        ),
        SizedBox(
          width: AppSize.s40,
          height: AppSize.s40,
          child: FloatingActionButton(
            onPressed: onTap,
            backgroundColor: ColorManager.primary,
            shape: CircleBorder(),
            child: Icon(Icons.arrow_forward_ios, color: ColorManager.white),
          ),
        ),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
