import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/utils/font_sizes.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.description.tr(),
          style: textTheme.bodyLarge?.copyWith(fontSize: FontSizes.s16),
        ),
        8.verticalSpace,
        Text(
          'Engineered for the urban night runner. The Neon Runner V2 features our proprietary luminous mesh technology for maximum visibility and breathability. The responsive foam sole adapts to your stride.',
          style: textTheme.bodySmall?.copyWith(fontSize: FontSizes.s14),
        ),
      ],
    );
  }
}
