import 'package:ibuild_vendor/core/constant/app_strings.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class InputDropdownField<T> extends StatelessWidget {
  const InputDropdownField(
      {super.key,
      required this.items,
      this.iconSize = 24.0,
      this.elevation = 8,
      required this.onChanged,
      this.alignment = AlignmentDirectional.centerStart,
      this.value,
      this.onTap,
      this.style,
      this.icon,
      this.itemHeight,
      this.decoration,
      this.menuMaxHeight,
      this.borderRadius,
      this.padding,
      this.validator,
      this.disabledHint,
      this.hint,
      this.labelText,
      this.dropMenuHeight = 50,
    this.hintText,
  });

  final void Function(T?)? onChanged;
  final void Function()? onTap;
  final String? Function(T?)? validator;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;
  final InputDecoration? decoration;
  final Widget? disabledHint;
  final int elevation;
  final Widget? hint;
  final Widget? icon;
  final double iconSize;
  final double? itemHeight;
  final List<DropdownMenuItem<T>>? items;
  final double? menuMaxHeight;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final T? value;
  final String? labelText;
  final String? hintText;
  final double? dropMenuHeight;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: AppColors.black,
      fontSize: 15,
      fontFamily: AppStringsConstants.fontFamily,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.25,
    );
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.black,
      ),
    );
    return SizedBox(
      height: dropMenuHeight,
      child: DropdownButtonFormField<T>(
        items: items,
        enableFeedback: true,
        onChanged: onChanged,
        onTap: onTap,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        iconSize: iconSize,
        validator: validator,
        elevation: elevation,
        alignment: alignment,
        style: style,
        icon: icon,
        itemHeight: itemHeight,
        decoration: decoration ??
            InputDecoration(
              alignLabelWithHint: true,
              border: border,
              enabledBorder: border,
              disabledBorder: border,
              focusedBorder: border,
              labelText: labelText,
              labelStyle: textStyle,
              hintText: hintText,
              hintStyle: textStyle,
            ),
        menuMaxHeight: menuMaxHeight,
        padding: padding,
        borderRadius: borderRadius,
      ),
    );
  }
}
