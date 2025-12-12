import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_systems_ltd/core/enums/api_enums.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:flutter_task_systems_ltd/core/widgets/error_display_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/product_details_bloc/product_details_bloc.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/product_card_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/product_details_shimmer_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/product_image_widget.dart';

class ProductDetailsBodyWidget extends StatelessWidget {
  const ProductDetailsBodyWidget({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case RequestStatus.initial:
          case RequestStatus.loading:
            return const ProductDetailsShimmerWidget();

          case RequestStatus.error:
            return ErrorDisplayWidget(
              errorDetails: state.errorMessage,
              onRetry: () {
                context.read<ProductDetailsBloc>().add(
                  ProductDetailsEvent(
                    type: ProductDetailsEventType.getProductDetails,
                    productId: productId,
                  ),
                );
              },
            );

          case RequestStatus.loaded:
            if (state.product == null) {
              return const ErrorDisplayWidget();
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductDetailsBloc>().add(
                  ProductDetailsEvent(
                    type: ProductDetailsEventType.refreshProductDetails,
                    productId: productId,
                  ),
                );
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: AppPadding.zero,
                children: [
                  ProductImageWidget(imageUrl: state.product!.image),
                  ProductCardWidget(product: state.product!),
                ],
              ),
            );
        }
      },
    );
  }
}
