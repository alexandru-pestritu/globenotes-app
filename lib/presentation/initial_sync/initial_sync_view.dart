import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/initial_sync/initial_sync_viewmodel.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';

class InitialSyncView extends StatefulWidget {
  const InitialSyncView({super.key});

  @override
  State<InitialSyncView> createState() => _InitialSyncViewState();
}

class _InitialSyncViewState extends State<InitialSyncView> {
  final InitialSyncViewModel _viewModel = instance<InitialSyncViewModel>();

  void _bind() {
    _viewModel.start();

    _viewModel.outputIsSyncSuccessful.listen((success) {
      if (success) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, Routes.setupCompletedRoute);
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          Theme.of(context).brightness == Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
      child: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          FlowState? flowState = snapshot.data;
          return Scaffold(
            body:
                (flowState?.getScreenWidget(
                  context,
                  _getContentWidget(),
                  _viewModel.retrySync,
                )) ??
                _getContentWidget(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p28),
      child: Center(
        child: StreamBuilder<bool>(
          stream: _viewModel.outputIsSyncFailed,
          builder: (context, snapshot) {
            final isFailed = snapshot.data ?? false;
            if (isFailed) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Center(
                      child: SvgPicture.asset(
                        ImageAssets.initialSyncIllustration,
                        width: AppSize.s300,
                        height: AppSize.s360,
                      ),
                    ),
                  ),
                  Text(
                    AppStrings.initialSyncFailedTitle.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: AppSize.s20),
                  Text(
                    AppStrings.initialSyncFailedDescription.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSize.s30),
                  SizedBox(
                    width: double.infinity,
                    height: AppSize.s45,
                    child: ElevatedButton(
                      onPressed: () => _viewModel.retrySync(),
                      child: Text(AppStrings.retry.tr()),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Center(
                      child: SvgPicture.asset(
                        ImageAssets.initialSyncIllustration,
                        width: AppSize.s300,
                        height: AppSize.s360,
                      ),
                    ),
                  ),

                  Text(
                    AppStrings.initialSyncTitle.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: AppSize.s15),
                  Text(
                    AppStrings.initialSyncDescription.tr(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSize.s40),
                  StreamBuilder<double>(
                    stream: _viewModel.outputSyncProgress,
                    builder: (context, progressSnapshot) {
                      final progress = progressSnapshot.data ?? 0.0;
                      final progressPercent = (progress * 100).toStringAsFixed(
                        0,
                      );
                      return Column(
                        children: [
                          LinearProgressIndicator(
                            value: progress,
                            minHeight: AppSize.s10,
                          ),
                          const SizedBox(height: AppSize.s12),
                          Text(
                            "$progressPercent% completed",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            }
          },
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
