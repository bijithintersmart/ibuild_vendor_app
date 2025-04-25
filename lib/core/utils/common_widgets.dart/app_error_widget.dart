import 'package:flutter/material.dart';

import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/theme/app_theme.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/primary_button.dart';

class ErrorWidgetClass extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const ErrorWidgetClass(this.errorDetails, {super.key});
  @override
  Widget build(BuildContext context) {
    return CustomErrorWidget(
      errorMessage: errorDetails.exceptionAsString(),
      stackTrace: errorDetails.stack,
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final StackTrace? stackTrace;
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    required this.stackTrace,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.secondary,
          ),
          title: const Text("App Crashed"),
        ),
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: AppColors.secondary,
                size: 60.0,
              ),
              const SizedBox(height: 10.0),
              const NormalText(
                text: 'Error Occurred !',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              NormalText(
                text: errorMessage,
                align: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
              if (stackTrace != null)
                NormalText(
                  text: stackTrace.toString(),
                  align: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  onPressed: () {
                    // Restart.restartApp(
                    //   notificationTitle: 'Restarting App',
                    //   notificationBody:
                    //       'Please tap here to open the app again.',
                    // );
                  },
                  child: const NormalText(
                    text: "Restart App",
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
