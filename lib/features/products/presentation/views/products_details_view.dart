import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/widgets/custom_app_bar.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/product_details_body_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/toggle_favorite_widget.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.productDetails.tr(),
        haveBackButton: true,
        actions: [const ToggleFavoriteWidget(), 16.horizontalSpace],
      ),
      body: const ProductDetailsBodyWidget(),
    );
  }
}
