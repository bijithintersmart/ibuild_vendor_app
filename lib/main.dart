import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_theme.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';

import 'core/utils/app_utils/error_handler.dart';

void main() {
  final errorHandler = AppErrorHandler();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeAppConfig();
    errorHandler.initialize();
    runApp(const MyApp());
  }, (error, stackTrace) {
    errorHandler.handleError(
      error,
      stackTrace,
      errorType: getExceptionType(error),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AppRouter.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AppRouter.networkCubit,
      child: MaterialApp.router(
        title: 'IBUILD Vendor app',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routerConfig: AppRouter.router,
        theme: AppTheme.appTheme,
        builder: EasyLoading.init(
          builder: (context, child) {
            return child ?? const SizedBox();
          },
        ),
      ),
    );
  }
}
