import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/services/di/di.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';
import 'package:flutter_task_systems_ltd/core/widgets/connectivity_indicator_widget.dart';
import 'package:flutter_task_systems_ltd/core/widgets/custom_app_bar.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/favorite_bloc/favorite_bloc.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/product_details_bloc/product_details_bloc.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/product_details_body_widget.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/product_details/toggle_favorite_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProductDetailsBloc>()
            ..add(
              ProductDetailsEvent(
                type: ProductDetailsEventType.getProductDetails,
                productId: productId,
              ),
            ),
        ),
        BlocProvider(
          create: (_) => getIt<FavoriteBloc>()
            ..add(
              FavoriteEvent(
                type: FavoriteEventType.checkFavorite,
                productId: productId,
              ),
            ),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.productDetails.tr(),
          haveBackButton: true,
          actions: [
            const ConnectivityIndicatorWidget(),
            8.horizontalSpace,
            ToggleFavoriteWidget(productId: productId),
            16.horizontalSpace,
          ],
        ),
        body: ProductDetailsBodyWidget(productId: productId),
      ),
    );
  }
}
