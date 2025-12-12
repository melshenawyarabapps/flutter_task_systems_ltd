import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      children: [
        RatingBar.builder(
          initialRating: 3,
          ignoreGestures: true,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: AppPadding.horizontalPadding(AppPadding.p2),
          itemSize: AppPadding.p24,
          itemBuilder: (context, _) => Icon(Icons.star, color: theme.cardColor),
          onRatingUpdate: (rating) {},
        ),
        8.horizontalSpace,
        Text('4.8', style: textTheme.bodyLarge),
        4.horizontalSpace,
        Text('(128 ${LocaleKeys.reviews.tr()})', style: textTheme.bodySmall),
      ],
    );
  }
}
