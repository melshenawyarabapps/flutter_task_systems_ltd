part of 'products_bloc.dart';

class ProductsEvent extends Equatable {
  final ProductsEventType type;

  const ProductsEvent({this.type = ProductsEventType.getProducts});

  ProductsEvent copyWith({ProductsEventType? type}) {
    return ProductsEvent(type: type ?? this.type);
  }

  @override
  List<Object?> get props => [type];
}
