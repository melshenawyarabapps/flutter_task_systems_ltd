part of 'connectivity_bloc.dart';

class ConnectivityState extends Equatable {
  final ConnectivityStatus status;
  final bool isConnected;

  const ConnectivityState({
    this.status = ConnectivityStatus.initial,
    this.isConnected = true,
  });

  ConnectivityState copyWith({ConnectivityStatus? status, bool? isConnected}) {
    return ConnectivityState(
      status: status ?? this.status,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => [status, isConnected];
}
