import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/resources/units_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/settings/app_settings/app_settings_viewmodel.dart';

class AppSettingsView extends StatefulWidget {
  const AppSettingsView({super.key});

  @override
  State<AppSettingsView> createState() => _AppSettingsViewState();
}

class _AppSettingsViewState extends State<AppSettingsView> {
  final AppSettingsViewModel _viewModel = instance<AppSettingsViewModel>();

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StreamBuilder(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        final flowState = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            title: Text(
              'App settings',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.appBarTheme.foregroundColor,
              ),
            ),
          ),
          body:
              flowState?.getScreenWidget(
                context,
                _buildContent(context),
                () => _viewModel.start(),
              ) ??
              _buildContent(context),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Sync on mobile data',
                  style: theme.textTheme.titleMedium,
                ),
              ),
              StreamBuilder<bool>(
                stream: _viewModel.outputSyncOnMobileData,
                builder: (context, snapshot) {
                  final isSyncOnMobile = snapshot.data ?? false;
                  return Switch(
                    value: isSyncOnMobile,
                    onChanged: (value) => _viewModel.setSyncOnMobileData(value),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'If disabled, your data will be synced only over Wi-Fi.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 16),

          Text('Sync status', style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          StreamBuilder<String>(
            stream: _viewModel.outputLastSync,
            builder: (context, snapshot) {
              final lastSyncText = snapshot.data ?? '';
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      lastSyncText.isNotEmpty
                          ? 'Last sync: $lastSyncText'
                          : 'Last sync: N/A',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorManager.error,
                    ),
                    onPressed: () => _viewModel.triggerManualSync(),
                    child: Text(
                      'Sync now',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ColorManager.error,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),

          Text('Photos', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'High resolution photo upload',
                  style: theme.textTheme.titleMedium,
                ),
              ),
              StreamBuilder<bool>(
                stream: _viewModel.outputHiResPhotoUpload,
                builder: (context, snapshot) {
                  final hiRes = snapshot.data ?? false;
                  return Switch(
                    value: hiRes,
                    onChanged: (value) => _viewModel.setHiResPhotoUpload(value),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'The original, high-resolution versions of your photos will be uploaded to our servers. You\'ll then be able to print your journal with high-resolution photos.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 24),

          Text('Measurement units', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Distance', style: theme.textTheme.titleMedium),
              StreamBuilder<String>(
                stream: _viewModel.outputDistanceUnit,
                builder: (context, snapshot) {
                  final distanceKey =
                      snapshot.data ?? DistanceUnit.kilometers.key;
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: distanceKey,
                      style: theme.textTheme.bodyMedium,
                      items:
                          DistanceUnit.values.map((unit) {
                            return DropdownMenuItem<String>(
                              value: unit.key,
                              child: Text(unit.translationKey.tr()),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _viewModel.setDistanceUnit(value);
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Temperatures', style: theme.textTheme.titleMedium),
              StreamBuilder<String>(
                stream: _viewModel.outputTemperatureUnit,
                builder: (context, snapshot) {
                  final tempKey = snapshot.data ?? TemperatureUnit.celsius.key;
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: tempKey,
                      style: theme.textTheme.bodyMedium,
                      items:
                          TemperatureUnit.values.map((unit) {
                            return DropdownMenuItem<String>(
                              value: unit.key,
                              child: Text(unit.translationKey.tr()),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _viewModel.setTemperatureUnit(value);
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
