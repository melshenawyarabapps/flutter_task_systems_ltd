import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/description_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/rating_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/title_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>()!;
    return Container(
      decoration: decorations.bigCardDecoration,
      transform: Matrix4.translationValues(0, -30.h, 0),
      padding: AppPadding.hvPadding(
        width: AppPadding.p24,
        height: AppPadding.p24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(),
          12.verticalSpace,
          const RatingWidget(),
          16.verticalSpace,
          const Divider(),
          16.verticalSpace,
          const DescriptionWidget(),
        ],
      ),
    );
  }
}
