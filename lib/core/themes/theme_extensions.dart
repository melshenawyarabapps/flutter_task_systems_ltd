import 'package:flutter/material.dart';

class AppDecorations extends ThemeExtension<AppDecorations> {
  final BoxDecoration cardDecoration;
  final BoxDecoration imageDecoration;
  final BoxDecoration bigCardDecoration;

  AppDecorations({
    required this.cardDecoration,
    required this.imageDecoration,
    required this.bigCardDecoration,
  });

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

@immutable
class ConnectivityColors extends ThemeExtension<ConnectivityColors> {
  final Color onlineColor;
  final Color offlineColor;
  final Color onlineBackgroundColor;
  final Color offlineBackgroundColor;
  final Color onlineBorderColor;
  final Color offlineBorderColor;

  const ConnectivityColors({
    required this.onlineColor,
    required this.offlineColor,
    required this.onlineBackgroundColor,
    required this.offlineBackgroundColor,
    required this.onlineBorderColor,
    required this.offlineBorderColor,
  });

  @override
  ConnectivityColors copyWith({
    Color? onlineColor,
    Color? offlineColor,
    Color? onlineBackgroundColor,
    Color? offlineBackgroundColor,
    Color? onlineBorderColor,
    Color? offlineBorderColor,
  }) {
    return ConnectivityColors(
      onlineColor: onlineColor ?? this.onlineColor,
      offlineColor: offlineColor ?? this.offlineColor,
      onlineBackgroundColor:
          onlineBackgroundColor ?? this.onlineBackgroundColor,
      offlineBackgroundColor:
          offlineBackgroundColor ?? this.offlineBackgroundColor,
      onlineBorderColor: onlineBorderColor ?? this.onlineBorderColor,
      offlineBorderColor: offlineBorderColor ?? this.offlineBorderColor,
    );
  }

  @override
  ConnectivityColors lerp(ThemeExtension<ConnectivityColors>? other, double t) {
    if (other is! ConnectivityColors) return this;

    return ConnectivityColors(
      onlineColor: Color.lerp(onlineColor, other.onlineColor, t)!,
      offlineColor: Color.lerp(offlineColor, other.offlineColor, t)!,
      onlineBackgroundColor: Color.lerp(
        onlineBackgroundColor,
        other.onlineBackgroundColor,
        t,
      )!,
      offlineBackgroundColor: Color.lerp(
        offlineBackgroundColor,
        other.offlineBackgroundColor,
        t,
      )!,
      onlineBorderColor: Color.lerp(
        onlineBorderColor,
        other.onlineBorderColor,
        t,
      )!,
      offlineBorderColor: Color.lerp(
        offlineBorderColor,
        other.offlineBorderColor,
        t,
      )!,
    );
  }
}

@immutable
class ShimmerColors extends ThemeExtension<ShimmerColors> {
  final Color baseColor;
  final Color highlightColor;
  final Color placeholderColor;
  final BoxDecoration placeholderDecoration;

  const ShimmerColors({
    required this.baseColor,
    required this.highlightColor,
    required this.placeholderColor,
    required this.placeholderDecoration,
  });

  @override
  ShimmerColors copyWith({
    Color? baseColor,
    Color? highlightColor,
    Color? placeholderColor,
    BoxDecoration? placeholderDecoration,
  }) {
    return ShimmerColors(
      baseColor: baseColor ?? this.baseColor,
      highlightColor: highlightColor ?? this.highlightColor,
      placeholderColor: placeholderColor ?? this.placeholderColor,
      placeholderDecoration:
          placeholderDecoration ?? this.placeholderDecoration,
    );
  }

  @override
  ShimmerColors lerp(ThemeExtension<ShimmerColors>? other, double t) {
    if (other is! ShimmerColors) return this;

    return ShimmerColors(
      baseColor: Color.lerp(baseColor, other.baseColor, t)!,
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t)!,
      placeholderColor: Color.lerp(
        placeholderColor,
        other.placeholderColor,
        t,
      )!,
      placeholderDecoration: BoxDecoration.lerp(
        placeholderDecoration,
        other.placeholderDecoration,
        t,
      )!,
    );
  }
}
