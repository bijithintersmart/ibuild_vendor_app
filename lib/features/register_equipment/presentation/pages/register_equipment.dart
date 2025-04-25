import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/constant/app_assets.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class RegisterEquipment extends StatefulWidget {
  const RegisterEquipment({super.key});

  @override
  State<RegisterEquipment> createState() => _RegisterEquipmentState();
}

class _RegisterEquipmentState extends State<RegisterEquipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppSvgs.star,
                width: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              NormalText(
                text: "Register Your Equipment",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: NormalText(
                  text:
                      "Enter your vehicle details, upload photos, and set rental preferences to list your equipment for rent",
                  align: TextAlign.center,
                  maxLine: 10,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black.withOpacity(.7),
                        letterSpacing: .7,
                      ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    GoRouter.of(context).push(Routes.ADD_EQUIPMENT);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(
                    Icons.handyman,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Add New Equipment',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
