import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/favorite_bloc/favorite_bloc.dart';

class ToggleFavoriteWidget extends StatelessWidget {
  const ToggleFavoriteWidget({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    final favColors = Theme.of(context).extension<FavoriteColors>()!;

    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        final bool isFavorite = state.isFavorite;

        return GestureDetector(
          onTap: () {
            context.read<FavoriteBloc>().add(
              FavoriteEvent(
                type: FavoriteEventType.toggleFavorite,
                productId: productId,
              ),
            );
          },
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
      },
    );
  }
}
