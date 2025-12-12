import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/routing/app_router.dart';
import 'package:flutter_task_systems_ltd/core/routing/app_routes.dart';
import 'package:flutter_task_systems_ltd/core/services/connectivity/connectivity_bloc.dart';
import 'package:flutter_task_systems_ltd/core/services/di/di.dart';
import 'package:flutter_task_systems_ltd/core/themes/app_theme.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_constants.dart';

class ProductsApp extends StatelessWidget {
  const ProductsApp._();

  factory ProductsApp() {
    _instance ??= const ProductsApp._();
    return _instance!;
  }

  static ProductsApp? _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, _) =>
          BlocProvider(
            create: (context) => getIt.get<ConnectivityBloc>(),
            child: MaterialApp(
              title: AppConstants.appName,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.dark,
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: AppRoutes.products,
            ),
          ),
    );
  }
}
