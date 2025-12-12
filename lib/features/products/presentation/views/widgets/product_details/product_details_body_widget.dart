import 'package:flutter/material.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/product_card_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/product_image_widget.dart';

class ProductDetailsBodyWidget extends StatelessWidget {
  const ProductDetailsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: AppPadding.zero,
      children: const [ProductImageWidget(), ProductCardWidget()],
    );
  }
}
