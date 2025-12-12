import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/utils/font_sizes.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

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
                'Neon Runner V2',
                style: textTheme.bodyLarge?.copyWith(fontSize: FontSizes.s20),
              ),
            ),
            8.horizontalSpace,
            Text('\$120.00', style: textTheme.bodyMedium),
          ],
        ),
        8.verticalSpace,
        Text(
          'Professional Running Gear',
          style: textTheme.bodySmall?.copyWith(fontSize: FontSizes.s14),
        )
      ],
    );
  }
}
