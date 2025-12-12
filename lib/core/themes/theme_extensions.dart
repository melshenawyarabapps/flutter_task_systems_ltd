import 'package:flutter/material.dart';

class AppDecorations extends ThemeExtension<AppDecorations> {
  final BoxDecoration cardDecoration;
  final BoxDecoration imageDecoration;
  final BoxDecoration bigCardDecoration;

  AppDecorations({required this.cardDecoration, required this.imageDecoration, required this.bigCardDecoration});

  @override
  AppDecorations copyWith({
    BoxDecoration? cardDecoration,
    BoxDecoration? imageDecoration,
    BoxDecoration? bigCardDecoration,
  }) {
    return AppDecorations(
      cardDecoration: cardDecoration ?? this.cardDecoration,
      imageDecoration: imageDecoration ?? this.imageDecoration,
      bigCardDecoration: bigCardDecoration ?? this.bigCardDecoration,
    );
  }

  @override
  AppDecorations lerp(ThemeExtension<AppDecorations>? other, double t) {
    if (other is! AppDecorations) return this;
    return AppDecorations(
      cardDecoration: BoxDecoration.lerp(
        cardDecoration,
        other.cardDecoration,
        t,
      )!,
      imageDecoration: BoxDecoration.lerp(
        imageDecoration,
        other.imageDecoration,
        t,
      )!,
      bigCardDecoration: BoxDecoration.lerp(
        bigCardDecoration,
        other.bigCardDecoration,
        t,
      )!,
    );
  }
}

@immutable
class FavoriteColors extends ThemeExtension<FavoriteColors> {
  final Color active;
  final Color inactive;
  final Color activeBackground;
  final Color inactiveBackground;
  final Color activeBorder;
  final Color inactiveBorder;

  const FavoriteColors({
    required this.active,
    required this.inactive,
    required this.activeBorder,
    required this.inactiveBorder,
    required this.activeBackground,
    required this.inactiveBackground,
  });

  @override
  FavoriteColors copyWith({
    Color? active,
    Color? inactive,
    Color? activeBackground,
    Color? inactiveBackground,
    Color? activeBorder,
    Color? inactiveBorder,
  }) {
    return FavoriteColors(
      active: active ?? this.active,
      inactive: inactive ?? this.inactive,
      inactiveBackground: inactiveBackground ?? this.inactiveBackground,
      activeBackground: activeBackground ?? this.activeBackground,
      activeBorder: activeBorder ?? this.activeBorder,
      inactiveBorder: inactiveBorder ?? this.inactiveBorder,
    );
  }

  @override
  FavoriteColors lerp(ThemeExtension<FavoriteColors>? other, double t) {
    if (other is! FavoriteColors) return this;

    return FavoriteColors(
      active: Color.lerp(active, other.active, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      inactiveBackground: Color.lerp(
        inactiveBackground,
        other.inactiveBackground,
        t,
      )!,
      activeBackground: Color.lerp(
        activeBackground,
        other.activeBackground,
        t,
      )!,
      activeBorder: Color.lerp(activeBorder, other.activeBorder, t)!,
      inactiveBorder: Color.lerp(inactiveBorder, other.inactiveBorder, t)!,
    );
  }
}
