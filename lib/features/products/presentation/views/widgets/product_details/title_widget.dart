import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/extensions/num_extensions.dart';
import 'package:flutter_task_systems_ltd/core/utils/font_sizes.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title, required this.price});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                title,
                style: textTheme.bodyLarge?.copyWith(fontSize: FontSizes.s20),
              ),
            ),
            8.horizontalSpace,
            Text(price.formatPrice, style: textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
