import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globenotes/app/extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';

enum StateRendererType {
  fullScreenLoadingState,
  fullScreenErrorState,
  contentScreenState,
  emptyScreenState,
  snackbarErrorState,
  snackbarSuccessState,
  popupConfirmActionState,
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function? retryActionFunction;

  const StateRenderer({
    super.key,
    required this.stateRendererType,
    required this.message,
    this.title = empty,
    required this.retryActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.fullScreenLoadingState:
        return _getItemsInColumn([
          _getAnimatedImage(animationPath: JsonAssets.loading),
        ]);

      case StateRendererType.fullScreenErrorState:
        return _getItemsInColumn([
          _getAnimatedImage(animationPath: JsonAssets.error, repeat: false),
          _getMessage(message, context),
          _getRetryButton(AppStrings.retry.tr(), context),
        ]);

      case StateRendererType.emptyScreenState:
        return _getItemsInColumn([
          _getAnimatedImage(animationPath: JsonAssets.empty, repeat: false),
          _getMessage(message, context),
        ]);

      case StateRendererType.contentScreenState:
      case StateRendererType.snackbarErrorState:
      case StateRendererType.snackbarSuccessState:
      case StateRendererType.popupConfirmActionState:
        return Container();
    }
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  Widget _getAnimatedImage({
    required String animationPath,
    double? size,
    bool? repeat,
  }) {
    return SizedBox(
      height: size ?? AppSize.s150,
      width: size ?? AppSize.s150,
      child: Lottie.asset(animationPath, repeat: repeat ?? true),
    );
  }

  Widget _getMessage(String message, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: SizedBox(
        width: AppSize.s200,
        child: ElevatedButton(
          onPressed: () {
            retryActionFunction?.call();
          },
          child: Text(buttonTitle),
        ),
      ),
    );
  }
}
