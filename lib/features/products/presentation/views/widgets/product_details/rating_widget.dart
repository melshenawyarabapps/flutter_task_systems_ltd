import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  final double rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating,
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
        Text(rating.toStringAsFixed(1), style: textTheme.bodyLarge),
        4.horizontalSpace,
        Text(
          '($ratingCount ${LocaleKeys.reviews.tr()})',
          style: textTheme.bodySmall,
        ),
      ],
    );
  }
}
