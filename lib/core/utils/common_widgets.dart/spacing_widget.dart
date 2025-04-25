import 'package:flutter/material.dart';

class SpacingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const SpacingWidget({super.key, this.height, this.width, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 10,
      width: width ?? 10,
      child: child,
    );
  }
}
