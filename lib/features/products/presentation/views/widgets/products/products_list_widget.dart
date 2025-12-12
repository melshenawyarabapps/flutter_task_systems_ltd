import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_padding.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/entities/product.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/views/widgets/products/product_widget.dart';

List<Product> recentProducts = [
  for (int index = 0; index < 10; index++)
    const Product(
      id: 5,
      title: 'Air Zoom Pulse',
      category: 'Medical',
      price: 140.00,
      image:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAXxLou3hfB3fxEU4Dsnd3iB2OicuCB1b9xseTOOk_TyQyYIxgdgBM2joEYhVfurKq1TJlE1bmxdXOgKLyL8Q9Pzd2yx4k2rTBxoDcRejYN6SqpX2Dv8OLPOI79wpzwGQr1Up-aqokG-eM0R4LNoUpZ4AfrRrLvlDfVNcXZWpLnCcxwuE_FZK7BhNQiWvO2rsuWOUumZ18aue5YyYjscrCCqQxBVjD46rn3uxaztS4Yvgup0wu2U9nUl782G5LYA1_fN1ZFyOoiOHd2',
      description:
          'The Nike Air Zoom Pulse is designed for healthcare professionals who need comfort and support during long shifts. It features responsive cushioning, a durable outsole, and a breathable upper to keep you comfortable all day long.',
      rating: 4.5,
      ratingCount: 150,
    ),
];

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppPadding.hvPadding(
       width: AppPadding.p16,
       height: AppPadding.p16,
      ),
      itemBuilder: (_, index) => ProductWidget(product: recentProducts[index]),
      separatorBuilder: (_, _) => 16.verticalSpace,
      itemCount: recentProducts.length,
    );
  }
}
