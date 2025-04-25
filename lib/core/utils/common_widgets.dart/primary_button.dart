import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final Widget? icon;
  final Color? backgroundColor;
  final Size? minimumSize;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.child,
    this.backgroundColor,
    this.icon,
    this.padding,
    this.minimumSize,
    this.borderRadius,
  });

  const PrimaryButton.icon({
    required Widget icon,
    required Widget child,
    Color? backgroundColor,
    void Function()? onPressed,
    Size? minimumSize,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
  }) : this(
          icon: icon,
          child: child,
          backgroundColor: backgroundColor,
          onPressed: onPressed,
          padding: padding,
          minimumSize: minimumSize,
          borderRadius: borderRadius,
        );

  const PrimaryButton.color({
    required Widget child,
    required Color backgroundColor,
    void Function()? onPressed,
    Widget? icon,
    Size? minimumSize,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
  }) : this(
          child: child,
          backgroundColor: backgroundColor,
          onPressed: onPressed,
          icon: icon,
          padding: padding,
          minimumSize: minimumSize,
          borderRadius: borderRadius,
        );

  const PrimaryButton.rounded({
    required Widget child,
    required BorderRadius borderRadius,
    void Function()? onPressed,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    Widget? icon,
    Size? minimumSize,
  }) : this(
          child: child,
          backgroundColor: backgroundColor,
          onPressed: onPressed,
          icon: icon,
          padding: padding,
          minimumSize: minimumSize,
          borderRadius: borderRadius,
        );

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      minimumSize: minimumSize ?? const Size(double.maxFinite, 50),
    );

    return icon != null
        ? ElevatedButton.icon(
            style: buttonStyle.copyWith(
                padding: WidgetStatePropertyAll(padding ?? const EdgeInsets.all(10)),
                backgroundColor: WidgetStatePropertyAll(backgroundColor)),
            onPressed: onPressed,
            icon: icon!,
            label: child,
          )
        : ElevatedButton(
            style: buttonStyle.copyWith(
                padding: WidgetStatePropertyAll(padding ?? const EdgeInsets.all(10)),
                backgroundColor: WidgetStatePropertyAll(backgroundColor)),
            onPressed: onPressed,
            child: child,
          );
  }
}
