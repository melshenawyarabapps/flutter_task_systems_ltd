part of 'product_details_bloc.dart';

class ProductDetailsEvent extends Equatable {
  final ProductDetailsEventType type;
  final int? productId;

  const ProductDetailsEvent({
    this.type = ProductDetailsEventType.getProductDetails,
    this.productId,
  });

  ProductDetailsEvent copyWith({
    ProductDetailsEventType? type,
    int? productId,
  }) {
    return ProductDetailsEvent(
      type: type ?? this.type,
      productId: productId ?? this.productId,
    );
  }

  @override
  List<Object?> get props => [type, productId];
}
