import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_systems_ltd/core/enums/api_enums.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/errors/app_exceptions.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/is_favorite.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/toggle_favorite.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final ToggleFavorite toggleFavorite;
  final IsFavorite isFavorite;

  FavoriteBloc({required this.toggleFavorite, required this.isFavorite})
    : super(const FavoriteState()) {
    on<FavoriteEvent>(_onFavoriteEvent);
  }

  Future<void> _onFavoriteEvent(
    FavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    if (event.productId == null) return;

    switch (event.type) {
      case FavoriteEventType.checkFavorite:
        emit(state.copyWith(status: RequestStatus.loading));
        try {
          final isFav = await isFavorite(event.productId!);
          emit(state.copyWith(status: RequestStatus.loaded, isFavorite: isFav));
        } catch (e) {
          emit(
            state.copyWith(
              status: RequestStatus.error,
              errorMessage: _getLocalizedError(e),
            ),
          );
        }
        break;

      case FavoriteEventType.toggleFavorite:
        try {
          await toggleFavorite(event.productId!);
          final isFav = await isFavorite(event.productId!);
          emit(state.copyWith(status: RequestStatus.loaded, isFavorite: isFav));
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
