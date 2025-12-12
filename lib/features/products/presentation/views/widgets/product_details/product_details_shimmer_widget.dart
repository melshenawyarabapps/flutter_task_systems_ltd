import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmerWidget extends StatelessWidget {
  const ProductDetailsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>()!;
    final shimmerColors = theme.extension<ShimmerColors>()!;

    return Shimmer.fromColors(
      baseColor: shimmerColors.baseColor,
      highlightColor: shimmerColors.highlightColor,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: AppPadding.zero,
        children: [
          Container(
            width: double.infinity,
            height: 300.h,
            color: shimmerColors.placeholderColor,
          ),

          Container(
            decoration: decorations.bigCardDecoration,
            transform: Matrix4.translationValues(0, -30.h, 0),
            padding: AppPadding.hvPadding(
              width: AppPadding.p24,
              height: AppPadding.p24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 24.h,
                  decoration: shimmerColors.placeholderDecoration,
                ),
                8.verticalSpace,
                Container(
                  width: 100.w,
                  height: 20.h,
                  decoration: shimmerColors.placeholderDecoration,
                ),
                12.verticalSpace,
                Container(
                  width: 150.w,
                  height: 20.h,
                  decoration: shimmerColors.placeholderDecoration,
                ),
                16.verticalSpace,
                const Divider(),
                16.verticalSpace,
                Container(
                  width: 120.w,
                  height: 18.h,
                  decoration: shimmerColors.placeholderDecoration,
                ),
                12.verticalSpace,
                ...List.generate(
                  4,
                  (index) => Padding(
                    padding: AppPadding.onlyPadding(bottom: AppPadding.p8),
                    child: Container(
                      width: double.infinity,
                      height: 14.h,
                      decoration: shimmerColors.placeholderDecoration,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
