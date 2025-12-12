import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/services/di/di.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/widgets/connectivity_indicator_widget.dart';
import 'package:flutter_task_systems_ltd/core/widgets/custom_app_bar.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/products_bloc/products_bloc.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/products/products_list_widget.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProductsBloc>()
            ..add(const ProductsEvent(type: ProductsEventType.getProducts)),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.products.tr(),
          actions: [const ConnectivityIndicatorWidget(), 16.horizontalSpace],
        ),
        body: const ProductsListWidget(),
      ),
    );
  }
}
