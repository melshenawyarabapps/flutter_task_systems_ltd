import 'package:flutter/material.dart';

class AppDecorations extends ThemeExtension<AppDecorations> {
  final BoxDecoration cardDecoration;
  final BoxDecoration imageDecoration;

  AppDecorations({required this.cardDecoration,required this.imageDecoration});

  @override
  AppDecorations copyWith({BoxDecoration? cardDecoration,BoxDecoration? imageDecoration}) {
    return AppDecorations(
      cardDecoration: cardDecoration ?? this.cardDecoration,
      imageDecoration: imageDecoration ?? this.imageDecoration,
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
    );
  }
}
