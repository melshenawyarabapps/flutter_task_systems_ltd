
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/widgets/custom_app_bar.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/products/products_list_widget.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.products.tr()),
      body: const ProductsListWidget(),
    );
  }
}
