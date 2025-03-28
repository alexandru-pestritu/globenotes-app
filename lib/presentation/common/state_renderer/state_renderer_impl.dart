import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globenotes/app/extensions.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/font_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

class LoadingState extends FlowState {
  final String message;
  LoadingState({String? message})
    : message = message ?? AppStrings.loading.tr();

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenLoadingState;
}

class ErrorState extends FlowState {
  final StateRendererType stateRendererType;
  final String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => empty;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.contentScreenState;
}

class EmptyState extends FlowState {
  final String message;
  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.emptyScreenState;
}

class SuccessState extends FlowState {
  final String message;
  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.snackbarSuccessState;
}

class ConfirmActionState extends FlowState {
  final String title;
  final String message;
  final String confirmText;
  final String denyText;
  final Function confirmAction;
  final Function denyAction;

  ConfirmActionState({
    required this.title,
    required this.message,
    required this.confirmText,
    required this.denyText,
    required this.confirmAction,
    required this.denyAction,
  });

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.popupConfirmActionState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryActionFunction,
  ) {
    return Stack(
      children: [
        contentScreenWidget,
        _getOverlayWidget(context, retryActionFunction),
      ],
    );
  }

  Widget _getOverlayWidget(BuildContext context, Function retryActionFunction) {
    switch (getStateRendererType()) {
      case StateRendererType.fullScreenLoadingState:
        return _buildTransparentBackground(
          context,
          StateRenderer(
            stateRendererType: StateRendererType.fullScreenLoadingState,
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          ),
        );

      case StateRendererType.fullScreenErrorState:
        return _buildTransparentBackground(
          context,
          StateRenderer(
            stateRendererType: StateRendererType.fullScreenErrorState,
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          ),
        );

      case StateRendererType.snackbarErrorState:
        _showSnackBar(context, getMessage(), isError: true);
        return Container();

      case StateRendererType.snackbarSuccessState:
        _showSnackBar(context, getMessage(), isError: false);
        return Container();

      case StateRendererType.contentScreenState:
      case StateRendererType.emptyScreenState:
        return Container();
      case StateRendererType.popupConfirmActionState:
        if (this is ConfirmActionState) {
          _showConfirmPopup(context, this as ConfirmActionState);
        }
        return Container();
    }
  }

  Widget _buildTransparentBackground(BuildContext context, Widget child) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDarkTheme ? Colors.black54 : Colors.white70,
      child: Center(child: child),
    );
  }

  void _showSnackBar(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: SizedBox(
              height: AppSize.s20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      message,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(AppPadding.p2),
                      child: Icon(
                        Icons.close,
                        size: AppSize.s18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: isError ? Colors.red[800] : Colors.green[800],
            duration: const Duration(milliseconds: DurationConstant.d3000),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(AppMargin.m16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
          ),
        );
    });
  }
}

void _showConfirmPopup(BuildContext context, ConfirmActionState state) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            state.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: Text(
            state.message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      state.denyAction();
                    },
                    child: Text(
                      state.denyText,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontSize: FontSize.s14),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      state.confirmAction();
                    },
                    child: Text(
                      state.confirmText,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        fontSize: FontSize.s14,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  });
}
