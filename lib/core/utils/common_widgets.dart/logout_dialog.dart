import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/constant/app_strings.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
// import 'package:ibuild_vendor/features/authentication/presentation/bloc/authentication_bloc.dart';

class LogoutDialog extends StatelessWidget {
   LogoutDialog({super.key});
  final Color primaryColor = AppColors.secondary;
  final Color darkBackground = const Color(0xFF212121);
  final Color surfaceColor = const Color(0xFF2C2C2C);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: darkBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor.withOpacity(0.4), width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.logout_rounded,
              size: 44,
              color: primaryColor,
            ),
            const SizedBox(height: 20),
            const Text(
              "Sign Out",
              style: TextStyle(
                fontFamily: AppStringsConstants.fontFamily,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Are you sure you want to sign out? You'll need to sign in again to access your account.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppStringsConstants.fontFamily,
                color: Colors.white70,
                fontSize: 14,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: surfaceColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontFamily: AppStringsConstants.fontFamily,
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // context
                      //     .read<AuthenticationBloc>()
                      //     .add(AuthenticationEvent.logout());
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(
                        fontFamily: AppStringsConstants.fontFamily,
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
