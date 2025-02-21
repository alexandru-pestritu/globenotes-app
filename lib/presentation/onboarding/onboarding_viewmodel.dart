import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController<SliderViewObject> _streamController =
      StreamController<SliderViewObject>.broadcast();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    if (_currentIndex < _list.length - 1) {
      _currentIndex++;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  int goPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderData() => [
    SliderObject(
      AppStrings.onBoardingTitle1.tr(),
      AppStrings.onBoardingSubTitle1.tr(),
      ImageAssets.onboardingIllustration1,
    ),
    SliderObject(
      AppStrings.onBoardingTitle2.tr(),
      AppStrings.onBoardingSubTitle2.tr(),
      ImageAssets.onboardingIllustration2,
    ),
    SliderObject(
      AppStrings.onBoardingTitle3.tr(),
      AppStrings.onBoardingSubTitle3.tr(),
      ImageAssets.onboardingIllustration3,
    ),
  ];

  void _postDataToView() {
    double progress = (_currentIndex + 1) / _list.length;
    inputSliderViewObject.add(
      SliderViewObject(
        slides: _list,
        currentIndex: _currentIndex,
        numOfSlides: _list.length,
        progress: progress,
      ),
    );
  }
}

mixin OnBoardingViewModelInputs {
  void start();
  void dispose();
  void onPageChanged(int index);
  int goNext();
  int goPrevious();

  Sink get inputSliderViewObject;
}

mixin OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  List<SliderObject> slides;
  int numOfSlides;
  int currentIndex;
  double progress;

  SliderViewObject({
    required this.slides,
    required this.numOfSlides,
    required this.currentIndex,
    required this.progress,
  });
}
