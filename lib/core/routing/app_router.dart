import 'package:flutter/material.dart';
import 'package:flutter_task_systems_ltd/core/routing/app_routes.dart';

class AppRouter {
  static AppRouter? _instance;

  static AppRouter get instance => _instance ??= AppRouter._();

  AppRouter._();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.products:
        return MaterialPageRoute(builder: (_) => Scaffold());
      case AppRoutes.productDetails:
        return MaterialPageRoute(builder: (_) => Scaffold());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
