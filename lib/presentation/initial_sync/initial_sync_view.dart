import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:globenotes/app/di.dart';
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
          Navigator.pushReplacementNamed(context, Routes.mainRoute);
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
          body:
              (flowState?.getScreenWidget(
                context,
                _getContentWidget(),
                _viewModel.retrySync,
              )) ??
              _getContentWidget(),
        );
      },
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
                  Text(
                    AppStrings.initialSyncTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: AppSize.s20),
                  Text(
                    AppStrings.initialSyncTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSize.s30),
                  ElevatedButton(
                    onPressed: () => _viewModel.retrySync(),
                    child: Text(AppStrings.retry),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.initialSyncTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: AppSize.s20),
                  Text(
                    AppStrings.initialSyncDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSize.s30),
                  StreamBuilder<double>(
                    stream: _viewModel.outputSyncProgress,
                    builder: (context, progressSnapshot) {
                      final progress = progressSnapshot.data ?? 0.0;
                      final progressPercent = (progress * 100).toStringAsFixed(
                        0,
                      );
                      return Column(
                        children: [
                          LinearProgressIndicator(value: progress),
                          const SizedBox(height: AppSize.s12),
                          Text("$progressPercent% completed"),
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
