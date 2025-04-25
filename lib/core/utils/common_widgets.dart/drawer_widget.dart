import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/dialogs.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/logout_dialog.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = AppColors.secondary;
    const Color darkBackground = Color(0xFF212121);
    const Color surfaceColor = Color(0xFF2C2C2C);

    return Drawer(
      backgroundColor: darkBackground,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                'AppSvgs.logoWithText',
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildDrawerItem(
            context: context,
            icon: Icons.gavel_outlined,
            title: "TERMS",
            primaryColor: primaryColor,
            onTap: () {
              Navigator.of(context).pop();
              scaffoldToast("Coming soon");
            },
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.quiz_outlined,
            title: "FAQ",
            primaryColor: primaryColor,
            onTap: () {
              Navigator.of(context).pop();
              scaffoldToast("Coming soon");
            },
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.policy_outlined,
            title: "POLICIES",
            primaryColor: primaryColor,
            onTap: () {
              Navigator.of(context).pop();
              scaffoldToast("Coming soon");
            },
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.withOpacity(0.3)),
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pop();
                _showLogoutDialog(context);
              
              },
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const NormalText(
                text: "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .9,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SvgPicture.asset(
            'AppSvgs.poweredBy',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    ShowDialogs.alertDialog(
      context,
      alertWidget: LogoutDialog(),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color primaryColor,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.05),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: primaryColor,
        ),
        title: NormalText(
          text: title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: primaryColor.withOpacity(0.7),
        ),
      ),
    );
  }
}
