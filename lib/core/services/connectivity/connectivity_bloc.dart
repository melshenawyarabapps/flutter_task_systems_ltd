import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  ConnectivityBloc({required this.connectivity})
    : super(const ConnectivityState()) {
    on<ConnectivityEvent>(_onConnectivityEvent);
    _startListening();
  }

  void _startListening() {
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final isConnected = !results.contains(ConnectivityResult.none);
      add(
        ConnectivityEvent(
          type: ConnectivityEventType.connectivityChanged,
          isConnected: isConnected,
        ),
      );
    });
    add(const ConnectivityEvent(type: ConnectivityEventType.checkConnectivity));
  }

  Future<void> _onConnectivityEvent(
    ConnectivityEvent event,
    Emitter<ConnectivityState> emit,
  ) async {
    switch (event.type) {
      case ConnectivityEventType.checkConnectivity:
        emit(state.copyWith(status: ConnectivityStatus.checking));
        final results = await connectivity.checkConnectivity();
        final isConnected = !results.contains(ConnectivityResult.none);
        emit(
          state.copyWith(
            status: isConnected
                ? ConnectivityStatus.connected
                : ConnectivityStatus.disconnected,
            isConnected: isConnected,
          ),
        );
        break;

      case ConnectivityEventType.connectivityChanged:
        final isConnected = event.isConnected ?? true;
        emit(
          state.copyWith(
            status: isConnected
                ? ConnectivityStatus.connected
                : ConnectivityStatus.disconnected,
            isConnected: isConnected,
          ),
        );
        break;
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
