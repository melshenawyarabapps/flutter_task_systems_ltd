import 'package:flutter/material.dart';

class ProductsApp extends StatelessWidget {
  const ProductsApp._();

  factory ProductsApp() {
    _instance ??= const ProductsApp._();
    return _instance!;
  }

  static ProductsApp? _instance;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
