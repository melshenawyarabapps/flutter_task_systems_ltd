import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';

class ToggleFavoriteWidget extends StatelessWidget {
  const ToggleFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isFavorite = true;

    final favColors = Theme.of(context).extension<FavoriteColors>()!;

    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isFavorite
              ? favColors.activeBackground
              : favColors.inactiveBackground,
          border: Border.all(
            color: isFavorite
                ? favColors.activeBorder
                : favColors.inactiveBorder,
          ),
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? favColors.active : favColors.inactive,
        ),
      ),
    );
  }
}
