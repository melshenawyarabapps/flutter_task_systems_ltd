part of 'favorite_bloc.dart';

class FavoriteEvent extends Equatable {
  final FavoriteEventType type;
  final int? productId;

  const FavoriteEvent({
    this.type = FavoriteEventType.checkFavorite,
    this.productId,
  });

  FavoriteEvent copyWith({FavoriteEventType? type, int? productId}) {
    return FavoriteEvent(
      type: type ?? this.type,
      productId: productId ?? this.productId,
    );
  }

  @override
  List<Object?> get props => [type, productId];
}
