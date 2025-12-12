import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_systems_ltd/app/products_app.dart';
import 'package:flutter_task_systems_ltd/core/config/app_config.dart';
import 'package:flutter_task_systems_ltd/core/translations/codegen_loader.g.dart';

Future<void> main() async {
  await AppConfig.instance.initApp();
  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: ProductsApp(),
    ),
  );
}
