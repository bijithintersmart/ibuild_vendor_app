import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';

import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

import '../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navController.jumpToTab(0);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: NormalText(
          text: "Profile",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  const CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.person,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        text: "Hi, kevin Pietersen.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      NormalText(
                        text: "+91 9995599955  kevin@gmail.com",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.greyDark.withOpacity(.8)),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          GoRouter.of(context).push(Routes.EDIT_PROFILE);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                        ),
                        icon: RotatedBox(
                            quarterTurns: 3,
                            child: Icon(Icons.expand_more_outlined,
                                color: AppColors.secondary)),
                        label: NormalText(
                          text: "Edit Profile",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.secondary),
                        ),
                        iconAlignment: IconAlignment.end,
                      )
                    ],
                  )),
                ],
              ),
            ),
            ProfileTile(
              onTap: () {
                GoRouter.of(context).push(Routes.MY_ADDRESS);
              },
              title: "Address",
              subTitle: "Share, Edit & New Address",
            ),
            // const ProfileTile(
            //   title: "Payment",
            //   subTitle: "Payment Modes",
            // ),
            ProfileTile(
              onTap: () {
                navController.jumpToTab(2);
                bookingTabNotifier = 2;
              },
              title: "Your Orders",
              subTitle: "Past Orders",
            ),
            const ProfileTile(
              title: "Help and Support",
              subTitle: "Need help or have a questions?.",
            ),
            const ProfileTile(
              title: "About",
              subTitle: "Company",
            ),
            const ProfileTile(
              title: "Terms and Condition",
              subTitle: "Need help or have a questions?.",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
