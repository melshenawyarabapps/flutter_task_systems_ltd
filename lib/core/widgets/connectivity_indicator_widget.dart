import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/services/connectivity/connectivity_bloc.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_radius.dart';

class ConnectivityIndicatorWidget extends StatelessWidget {
  const ConnectivityIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final connectivityColors = theme.extension<ConnectivityColors>()!;

    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        final color = state.isConnected
            ? connectivityColors.onlineColor
            : connectivityColors.offlineColor;
        final backgroundColor = state.isConnected
            ? connectivityColors.onlineBackgroundColor
            : connectivityColors.offlineBackgroundColor;
        final borderColor = state.isConnected
            ? connectivityColors.onlineBorderColor
            : connectivityColors.offlineBorderColor;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: AppPadding.hvPadding(
            width: AppPadding.p8,
            height: AppPadding.p4,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: AppRadius.all(AppRadius.r12),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                state.isConnected ? Icons.wifi : Icons.wifi_off,
                size: 16.sp,
                color: color,
              ),
              4.horizontalSpace,
              Text(
                state.isConnected
                    ? LocaleKeys.online.tr()
                    : LocaleKeys.offline.tr(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
