import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';

class ErrorDisplayWidget extends StatelessWidget {
  const ErrorDisplayWidget({
    super.key,
    this.message,
    this.errorDetails,
    this.onRetry,
    this.icon,
    this.iconSize,
  });

  final String? message;
  final String? errorDetails;
  final VoidCallback? onRetry;
  final IconData? icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppPadding.all(AppPadding.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: iconSize ?? 64.sp,
              color: theme.colorScheme.error,
            ),
            16.verticalSpace,
            Text(
              message ?? LocaleKeys.errorLoadingProducts.tr(),
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (errorDetails != null) ...[
              8.verticalSpace,
              Text(
                errorDetails!,
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              16.verticalSpace,
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(LocaleKeys.retry.tr()),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
