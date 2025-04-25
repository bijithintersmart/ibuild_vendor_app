import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/constant/app_strings.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/primary_button.dart';
import 'package:lottie/lottie.dart';

import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;
  final Function() onPressed;
  const ErrorScreen({
    super.key,
    required this.onPressed,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              'assets/lotties/error.json',
              alignment: Alignment.center,
              repeat: false,
              fit: BoxFit.cover,
              backgroundLoading: true,
            ),
            const SizedBox(
              height: 10,
            ),
            const NormalText(
              text: "Opps Somtheing went wrong",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: AppStringsConstants.fontFamily),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: NormalText(
                text: message ?? "",
                maxLine: 10,
                style: TextStyle(
                    fontSize: 17,
                    color: AppColors.black,
                    fontFamily: AppStringsConstants.fontFamily,
                    fontWeight: FontWeight.w300,
                    height: 1.40,
                    letterSpacing: .6),
                align: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              onPressed: onPressed,
              child: const NormalText(
                text: "Retry",
                style: TextStyle(
                  fontFamily: AppStringsConstants.fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
