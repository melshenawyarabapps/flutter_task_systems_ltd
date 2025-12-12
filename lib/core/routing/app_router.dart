import 'package:flutter/material.dart';
import 'package:flutter_task_systems_ltd/core/routing/app_routes.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/products_view.dart';

import '../../features/products/presentation/views/products_details_view.dart';

abstract class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.products:
        return MaterialPageRoute(builder: (_) => const ProductsView());
      case AppRoutes.productDetails:
        return MaterialPageRoute(
          builder: (_) =>
              ProductDetailsView(productId: settings.arguments as int),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
