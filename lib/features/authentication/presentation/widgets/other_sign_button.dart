import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';

class OtherSignInButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const OtherSignInButton({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        color: AppColors.greyLight,
        child: SizedBox(height: 60, width: 80, child: child),
      ),
    );
  }
}
