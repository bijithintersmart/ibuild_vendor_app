import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibuild_vendor/core/constant/app_strings.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:ibuild_vendor/features/network/presentation/cubit/network_cubit.dart';
import 'package:open_settings_plus/open_settings_plus.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  static const Color lightColor = Color(0xFFE8F5E4);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurfaceColor = Color(0xFF1E1E1E); 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkBackground,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.5,
                height: size.width * 0.5,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppColors.secondary.withOpacity(0.3),
                      darkBackground.withOpacity(0.1),
                    ],
                    stops: const [0.1, 1.0],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.wifi_off_rounded,
                  size: 80,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 40),
              const NormalText(
                text: 'No Internet Connection',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppStringsConstants.fontFamily,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const NormalText(
                text: 'Please check your connection and try again',
                align: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppStringsConstants.fontFamily,
                  color: Color(0xFFBDBDBD),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: darkSurfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.secondary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NormalText(
                      text: 'Possible Causes:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: lightColor,
                        fontFamily: AppStringsConstants.fontFamily,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildCauseItem('Airplane mode is turned on'),
                    _buildCauseItem('Wi-Fi or mobile data is turned off'),
                    _buildCauseItem('Router issues'),
                    _buildCauseItem('Poor signal strength'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<NetworkCubit>().checkConnectivity();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.refresh, size: 18),
                            SizedBox(width: 8),
                            NormalText(
                              text: 'Try Again',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppStringsConstants.fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () async {
                          final settings = OpenSettingsPlus.shared;
                          if (Platform.isAndroid &&
                              settings is OpenSettingsPlusAndroid) {
                            await settings.wifi();
                          } else if (Platform.isIOS &&
                              settings is OpenSettingsPlusIOS) {
                            await settings.cellular();
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.secondary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.settings,
                                size: 18, color: AppColors.secondary),
                            const SizedBox(width: 8),
                            NormalText(
                              text: 'Settings',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppStringsConstants.fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCauseItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.circle,
            size: 8,
            color: lightColor.withOpacity(0.7),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: NormalText(
              text: text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[300],
                fontFamily: AppStringsConstants.fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
