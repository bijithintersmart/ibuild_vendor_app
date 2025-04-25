import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/features/network/presentation/cubit/network_cubit.dart';

class GlobalNetworkService {
  static final GlobalNetworkService _instance =
      GlobalNetworkService._internal();

  factory GlobalNetworkService() => _instance;

  GlobalNetworkService._internal() {
    
    final tempRouter = GoRouter(
      routes: [GoRoute(path: '/', builder: (_, __) => const SizedBox())],
    );
    networkCubit = NetworkCubit(router: tempRouter);
  }
  late NetworkCubit networkCubit;
  void initialize(GoRouter router) {
    networkCubit.close();    
    networkCubit = NetworkCubit(router: router);
  }
}
