import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_systems_ltd/core/enums/api_enums.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/widgets/empty_data_widget.dart';
import 'package:flutter_task_systems_ltd/core/widgets/error_display_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/products_bloc/products_bloc.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/products/product_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/products/products_list_shimmer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        switch (state.status) {
          case RequestStatus.initial:
          case RequestStatus.loading:
            return const ProductsListShimmerWidget();

          case RequestStatus.error:
            return ErrorDisplayWidget(
              errorDetails: state.errorMessage,
              onRetry: () {
                context.read<ProductsBloc>().add(
                  const ProductsEvent(type: ProductsEventType.getProducts),
                );
              },
            );

          case RequestStatus.loaded:
            if (state.products.isEmpty) {
              return const EmptyDataWidget();
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductsBloc>().add(
                  const ProductsEvent(type: ProductsEventType.refreshProducts),
                );
              },
              child: ListView.separated(
                padding: AppPadding.hvPadding(
                  width: AppPadding.p16,
                  height: AppPadding.p16,
                ),
                itemBuilder: (_, index) =>
                    ProductWidget(product: state.products[index]),
                separatorBuilder: (_, __) => 16.verticalSpace,
                itemCount: state.products.length,
              ),
            );
        }
      },
    );
  }
}
