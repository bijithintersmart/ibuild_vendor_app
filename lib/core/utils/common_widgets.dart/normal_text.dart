import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/constant/app_strings.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';

class NormalText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextStyle? style;
  final Color? color;
  final TextAlign? align;
  final FontWeight? weight;
  final TextDecoration? decoration;
  final int? maxLine;
  final double? lineHeight;
  final TextDirection? textDirection;
  const NormalText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.style,
    this.align,
    this.color = Colors.black,
    this.weight,
    this.decoration,
    this.maxLine = 2,
    this.lineHeight,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontStyle: FontStyle.normal,
            height: lineHeight,
            color: color,
            fontWeight: weight,
            decoration: decoration,
            decorationColor: AppColors.black,
            fontFamily: AppStringsConstants.fontFamily,
          ),
      textAlign: align,
      maxLines: maxLine,
      textDirection: textDirection,
      overflow: TextOverflow.ellipsis,
    );
  }
}
