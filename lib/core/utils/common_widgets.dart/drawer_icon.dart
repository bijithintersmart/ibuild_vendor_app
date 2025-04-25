import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () => {
          vibrateDevice(HapticsType.selection),
          scaffoldKey.currentState?.openEndDrawer(),
        },
        icon: SvgPicture.asset('AppSvgs.drawer',
            width: 40, height: 40, fit: BoxFit.cover),
      ),
    );
  }
}
