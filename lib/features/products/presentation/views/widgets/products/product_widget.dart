import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/extensions/context_extensions.dart';
import 'package:flutter_task_systems_ltd/core/extensions/num_extensions.dart';
import 'package:flutter_task_systems_ltd/core/routing/app_routes.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:flutter_task_systems_ltd/core/widgets/network_image_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/entities/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>()!;
    final textThemes = theme.textTheme;

    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.productDetails, arguments: product.id);
      },
      child: Container(
        padding: AppPadding.all(AppPadding.p12),
        decoration: decorations.cardDecoration,
        child: Row(
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: decorations.imageDecoration,
              clipBehavior: Clip.antiAlias,
              padding: AppPadding.all(AppPadding.p4),
              child: NetworkImageWidget(imageUrl: product.image),
            ),
            12.horizontalSpace,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    style: textThemes.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.verticalSpace,
                  Text(product.category, style: textThemes.bodySmall),
                  12.verticalSpace,
                  Text(product.price.formatPrice, style: textThemes.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
