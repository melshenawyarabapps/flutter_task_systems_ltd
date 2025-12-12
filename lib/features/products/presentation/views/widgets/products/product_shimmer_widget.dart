import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_radius.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>()!;
    final shimmerColors = theme.extension<ShimmerColors>()!;

    return Shimmer.fromColors(
      baseColor: shimmerColors.baseColor,
      highlightColor: shimmerColors.highlightColor,
      child: Container(
        padding: AppPadding.all(AppPadding.p12),
        decoration: decorations.cardDecoration,
        child: Row(
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: shimmerColors.placeholderDecoration.copyWith(
                borderRadius: AppRadius.all(AppRadius.r12),
              ),
            ),
            12.horizontalSpace,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 16.h,
                    decoration: shimmerColors.placeholderDecoration,
                  ),
                  8.verticalSpace,
                  Container(
                    width: 80.w,
                    height: 12.h,
                    decoration: shimmerColors.placeholderDecoration,
                  ),
                  12.verticalSpace,
                  Container(
                    width: 60.w,
                    height: 14.h,
                    decoration: shimmerColors.placeholderDecoration,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
