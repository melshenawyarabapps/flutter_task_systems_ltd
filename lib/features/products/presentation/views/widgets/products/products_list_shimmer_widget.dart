import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/products/product_shimmer_widget.dart';

class ProductsListShimmerWidget extends StatelessWidget {
  const ProductsListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: AppPadding.hvPadding(
        width: AppPadding.p16,
        height: AppPadding.p16,
      ),
      itemBuilder: (_, __) => const ProductShimmerWidget(),
      separatorBuilder: (_, __) => 16.verticalSpace,
      itemCount: 8,
    );
  }
}
