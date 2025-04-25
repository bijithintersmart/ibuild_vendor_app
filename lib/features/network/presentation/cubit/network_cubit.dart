import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';

import '../../domain/entities/enum.dart';
import 'network_state.dart';


class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final String noInternetRoute;
  final GoRouter router;

  NetworkCubit({
    required this.router,
    this.noInternetRoute = Routes.NOT_INTERNET,
  }) : super(NetworkState.initial()) {
    _initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      debugPrint('Could not check connectivity status: $e');
      return;
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    final currentLocation =
        router.routerDelegate.currentConfiguration.uri.toString();

    if (result.first == ConnectivityResult.none) {
      
      if (state.status == ConnectionStatus.online &&
          currentLocation != noInternetRoute) {
        
        emit(state.copyWith(
          status: ConnectionStatus.offline,
          lastOnlineRoute: currentLocation,
        ));
        router.go(noInternetRoute);
      } else {
        emit(state.copyWith(status: ConnectionStatus.offline));
      }
    } else if (state.status == ConnectionStatus.offline) {
      
      emit(state.copyWith(status: ConnectionStatus.online));

      
      if (router.routerDelegate.currentConfiguration.uri.toString() ==
              noInternetRoute &&
          state.lastOnlineRoute != null) {
        router.go(state.lastOnlineRoute!);
      }
    }
  }

  void checkConnectivity() {
    _initConnectivity();
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
