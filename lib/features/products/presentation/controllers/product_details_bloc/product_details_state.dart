part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final RequestStatus status;
  final Product? product;
  final String? errorMessage;
  final bool isFromCache;

  const ProductDetailsState({
    this.status = RequestStatus.initial,
    this.product,
    this.errorMessage,
    this.isFromCache = false,
  });

  ProductDetailsState copyWith({
    RequestStatus? status,
    Product? product,
    String? errorMessage,
    bool? isFromCache,
  }) {
    return ProductDetailsState(
      status: status ?? this.status,
      product: product ?? this.product,
      errorMessage: errorMessage,
      isFromCache: isFromCache ?? this.isFromCache,
    );
  }

  @override
  List<Object?> get props => [status, product, errorMessage, isFromCache];
}
