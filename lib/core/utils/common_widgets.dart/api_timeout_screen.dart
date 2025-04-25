import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibuild_vendor/core/constant/app_strings.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:lottie/lottie.dart';

class ApiTimeoutErrorScreen extends StatelessWidget {
  const ApiTimeoutErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'assets/lotties/server_issue.json',
                  width: 300,
                ),
                const SizedBox(height: 20),
                const NormalText(
                  text: 'Oops! Connection Lost',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppStringsConstants.fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const NormalText(
                  text:
                      "It seems we've lost connection. Please try again later. Our service is temporarily unavailable, but we're working hard to get back up and running. Thank you for your patience!",
                  maxLine: 10,
                  align: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppStringsConstants.fontFamily,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const NormalText(
                    text: 'Exit',
                    style: TextStyle(
                      fontFamily: AppStringsConstants.fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
