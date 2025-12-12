part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final RequestStatus status;
  final List<Product> products;
  final String? errorMessage;
  final bool isFromCache;

  const ProductsState({
    this.status = RequestStatus.initial,
    this.products = const [],
    this.errorMessage,
    this.isFromCache = false,
  });

  ProductsState copyWith({
    RequestStatus? status,
    List<Product>? products,
    String? errorMessage,
    bool? isFromCache,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage,
      isFromCache: isFromCache ?? this.isFromCache,
    );
  }

  @override
  List<Object?> get props => [status, products, errorMessage, isFromCache];
}
