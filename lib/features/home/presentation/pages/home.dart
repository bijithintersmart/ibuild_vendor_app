import 'dart:math';

import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/svg.dart';
import 'package:ibuild_vendor/core/constant/app_assets.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import '../widgets/widgets.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final notificationCount = Random().nextInt(5);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          surfaceTintColor: Colors.white,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.cardGrey,
          leadingWidth: 90,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SvgPicture.asset(AppSvgs.appLogoText),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -15, end: -10),
                showBadge: notificationCount > 0,
                ignorePointer: true,
                onTap: () {},
                badgeContent: Text(
                    "$notificationCount",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.primary),
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  badgeColor: AppColors.secondary,
                  padding: const EdgeInsets.all(6),
                  elevation: 0,
                ),
                  child: GestureDetector(
                      onTap: () {
                      navController.jumpToTab(
                        3,
                      );
                      },
                      child: const Icon(Icons.notifications_outlined))
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderStatusScreen(),
            SizedBox(height: 15),
            HomeUpcommingWidget(),
            SizedBox(height: 15),
            HomePendingOrderWidget(),
            SizedBox(height: 15),
            CompletedOrdersWidget(),
            SizedBox(
              height: kBottomNavigationBarHeight,
            ),
          ],
        ),
      ),
    );
  }
}
