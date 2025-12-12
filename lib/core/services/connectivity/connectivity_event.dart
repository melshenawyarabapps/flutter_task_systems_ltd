part of 'connectivity_bloc.dart';

class ConnectivityEvent extends Equatable {
  final ConnectivityEventType type;
  final bool? isConnected;

  const ConnectivityEvent({
    this.type = ConnectivityEventType.checkConnectivity,
    this.isConnected,
  });

  ConnectivityEvent copyWith({ConnectivityEventType? type, bool? isConnected}) {
    return ConnectivityEvent(
      type: type ?? this.type,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => [type, isConnected];
}
