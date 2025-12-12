import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      children: [
        ...List.generate(5, (index) {
          return Icon(Icons.star, color: theme.cardColor);
        }),
        8.horizontalSpace,
        Text('4.8', style: textTheme.bodyLarge),
        4.horizontalSpace,
        Text('(128 ${LocaleKeys.reviews.tr()})', style: textTheme.bodySmall),
      ],
    );
  }
}
