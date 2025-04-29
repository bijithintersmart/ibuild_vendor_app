import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/three_triangle_loader.dart';
import 'package:lottie/lottie.dart';

class AppLoaderWidget extends StatelessWidget {
  final double size;
  final double? loaderWidgetSize;
  const AppLoaderWidget({
    super.key,
    this.size = 80, this.loaderWidgetSize 
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: loaderWidgetSize,
        height: loaderWidgetSize,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              TwoRotatingArc(
                color: AppColors.secondary,
                size: size - 15,
              ),
              Lottie.asset(
                'assets/lotties/app_loader.json',
                fit: BoxFit.cover,
                width: size - 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AppImageLoader extends StatelessWidget {
  const AppImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        'assets/lotties/app_loader.json',
      ),
    );
  }
}
