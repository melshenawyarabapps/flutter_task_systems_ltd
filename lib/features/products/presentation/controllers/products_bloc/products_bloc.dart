import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_systems_ltd/core/enums/api_enums.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/errors/app_exceptions.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/entities/product.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/get_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;

  ProductsBloc({required this.getProducts}) : super(const ProductsState()) {
    on<ProductsEvent>(_onProductsEvent);
  }

  Future<void> _onProductsEvent(
    ProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    switch (event.type) {
      case ProductsEventType.getProducts:
        emit(state.copyWith(status: RequestStatus.loading));
        try {
          final products = await getProducts();
          emit(
            state.copyWith(status: RequestStatus.loaded, products: products),
          );
        } catch (e) {
          emit(
            state.copyWith(
              status: RequestStatus.error,
              errorMessage: _getLocalizedError(e),
            ),
          );
        }
        break;

      case ProductsEventType.refreshProducts:
        try {
          final products = await getProducts();
          emit(
            state.copyWith(status: RequestStatus.loaded, products: products),
          );
        } catch (e) {
          emit(
            state.copyWith(
              status: RequestStatus.error,
              errorMessage: _getLocalizedError(e),
            ),
          );
        }
        break;
    }
  }

  String _getLocalizedError(Object e) {
    if (e is AppException) {
      return e.localeKey.tr();
    }
    return e.toString();
  }
}
