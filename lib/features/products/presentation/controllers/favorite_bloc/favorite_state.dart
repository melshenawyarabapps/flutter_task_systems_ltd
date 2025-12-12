part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final RequestStatus status;
  final bool isFavorite;
  final String? errorMessage;

  const FavoriteState({
    this.status = RequestStatus.initial,
    this.isFavorite = false,
    this.errorMessage,
  });

  FavoriteState copyWith({
    RequestStatus? status,
    bool? isFavorite,
    String? errorMessage,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      isFavorite: isFavorite ?? this.isFavorite,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, isFavorite, errorMessage];
}
