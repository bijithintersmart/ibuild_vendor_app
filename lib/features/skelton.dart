import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/features/booking/presentation/pages/booking.dart';
import 'package:ibuild_vendor/features/equipments/presentation/pages/equipments.dart';
import 'package:ibuild_vendor/features/home/presentation/pages/home.dart';
import 'package:ibuild_vendor/features/notification/presentation/pages/notification.dart';
import 'package:ibuild_vendor/features/profile/presentation/pages/profile.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Skelton extends StatefulWidget {
  const Skelton({
    super.key,
    required this.controller,
  });

  final PersistentTabController controller;

  @override
  State<Skelton> createState() => _SkeltonState();
}

class _SkeltonState extends State<Skelton> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const iconColor = Color(0xff475467);
    const iconSize = 25.0;
    return PersistentTabView(
      controller: widget.controller,
      backgroundColor: Colors.transparent,
      tabs: [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home_outlined, size: iconSize),
            inactiveIcon: const Icon(
              Icons.home_outlined,
              size: iconSize,
              color: iconColor,
            ),
            title: "Home",
            activeForegroundColor: AppColors.secondary,
            inactiveBackgroundColor: iconColor,
          ),
        ),
        PersistentTabConfig(
            screen: const EquipmentScreen(),
            item: ItemConfig(
              icon: const Icon(
                Icons.local_shipping,
                size: iconSize,
              ),
              inactiveIcon: const Icon(
                Icons.local_shipping_outlined,
                size: iconSize,
                color: iconColor,
              ),
              title: "Equipments",
              activeForegroundColor: AppColors.secondary,
              inactiveBackgroundColor: iconColor,
            )),
        PersistentTabConfig(
            screen: const BookingScreen(),
            item: ItemConfig(
              icon: const Icon(
                Icons.calendar_month,
                size: iconSize,
              ),
              inactiveIcon: const Icon(
                Icons.calendar_month_outlined,
                size: iconSize,
                color: iconColor,
              ),
              title: "Bookings",
              activeForegroundColor: AppColors.secondary,
              inactiveBackgroundColor: iconColor,
            )),
        PersistentTabConfig(
            screen: const NotificationListScreen(),
            item: ItemConfig(
              icon: const Icon(
                Icons.notifications,
                size: iconSize,
              ),
              inactiveIcon: const Icon(Icons.notifications_outlined,
                  size: iconSize, color: iconColor),
              title: "Notifications",
              activeForegroundColor: AppColors.secondary,
              inactiveBackgroundColor: iconColor,
            )),
        PersistentTabConfig(
            screen: const ProfileScreen(),
            item: ItemConfig(
              icon: const Icon(
                Icons.person,
                size: iconSize,
              ),
              inactiveIcon: const Icon(
                Icons.person_outline,
                size: iconSize,
                color: iconColor,
              ),
              title: "Profile",
              activeForegroundColor: AppColors.secondary,
              inactiveBackgroundColor: iconColor,
            )),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig.copyWith(),
        navBarDecoration: const NavBarDecoration(
          color: Colors.white,
        ),
      ),
      navBarOverlap: const NavBarOverlap.none(),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.iconPath});

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      fit: BoxFit.contain,
      width: 30,
    );
  }
}
