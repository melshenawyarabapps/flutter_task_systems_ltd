import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_systems_ltd/core/enums/api_enums.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/errors/app_exceptions.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/entities/product.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/get_product_by_id.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductById getProductById;

  ProductDetailsBloc({required this.getProductById})
    : super(const ProductDetailsState()) {
    on<ProductDetailsEvent>(_onProductDetailsEvent);
  }

  Future<void> _onProductDetailsEvent(
    ProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    if (event.productId == null) return;

    switch (event.type) {
      case ProductDetailsEventType.getProductDetails:
        emit(state.copyWith(status: RequestStatus.loading));
        try {
          final product = await getProductById(event.productId!);
          emit(state.copyWith(status: RequestStatus.loaded, product: product));
        } catch (e) {
          emit(
            state.copyWith(
              status: RequestStatus.error,
              errorMessage: _getLocalizedError(e),
            ),
          );
        }
        break;

      case ProductDetailsEventType.refreshProductDetails:
        try {
          final product = await getProductById(event.productId!);
          emit(state.copyWith(status: RequestStatus.loaded, product: product));
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
