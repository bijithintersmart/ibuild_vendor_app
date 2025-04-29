import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibuild_vendor/core/constant/app_strings.dart';

import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? preffix;
  final bool readOnly;
  final Color? fillColors;
  final int? maxLength;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double titleSpacing;
  final String title;
  final TextStyle? titleStyle;
  final TextInputAction? textInputAction;
  final bool hideLabel;
  final int? maxLine;
  final String? errorMessage;
  final String obscuringCharacter;
  final bool obscureText;
  final int? errorMaxLines;
  final String? hintText;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final InputDecoration? decoration;
  final Color borderColor;
  final double borderWidth;
  final double? elevation;
  final BorderRadius? feildRadius;
  final bool? autofocus;
  InputField({
    super.key,
    required this.labelText,
    this.controller,
    this.decoration,
    this.contentPadding,
    this.initialValue,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.preffix,
    this.errorMaxLines,
    this.hintText,
    this.fillColors,
    this.readOnly = false,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.title = '',
    this.titleSpacing = 10,
    this.titleStyle,
    this.textInputAction,
    this.maxLine = 1,
    this.errorMessage,
    this.hideLabel = false,
    this.autovalidateMode,
    this.borderWidth = 1,
    this.elevation = 0,
    this.feildRadius,
    this.autofocus,
    this.borderColor = Colors.transparent,
  });

  final textStyle = TextStyle(
    color: AppColors.black,
    fontSize: 15,
    fontFamily: AppStringsConstants.fontFamily,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.25,
  );
  final hintStyle = TextStyle(
    color: const Color(0xff6A6A6A).withOpacity(.5),
    fontSize: 15,
    fontFamily: AppStringsConstants.fontFamily,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );
  @override
  Widget build(BuildContext context) {
    BorderRadius radius = feildRadius ?? BorderRadius.circular(15);
    final border = OutlineInputBorder(
      borderRadius: feildRadius ?? BorderRadius.circular(15),
      borderSide: BorderSide(
        width: borderWidth,
        color: borderColor,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: NormalText(
              text: title,
              style: titleStyle ??
                  const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Canaro',
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        TextFormField(
          initialValue: initialValue,
          validator: validator,
          autofocus: autofocus ?? false,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          forceErrorText: errorMessage,
          textInputAction: textInputAction,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          controller: controller,
          maxLines: maxLine,
          keyboardType: keyboardType,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          style: textStyle,
          onTap: onTap,
          textCapitalization: textCapitalization,
          maxLength: maxLength,
          decoration: decoration ??
              InputDecoration(
                filled: true,
                prefixIcon: preffix,
                contentPadding: contentPadding,
                errorMaxLines: errorMaxLines ?? 3,
                counterText: '',
                suffixIcon: suffix,
                border: border,
                enabledBorder: border,
                errorBorder: border.copyWith(
                  borderRadius: radius,
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: border.copyWith(
                  borderRadius: radius,
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                focusedBorder: border,
                labelText: hideLabel || labelText.isEmpty ? null : labelText,
                labelStyle: hintStyle,
                hintText: hintText ?? (hideLabel ? labelText : null),
                hintStyle: hintStyle,
                fillColor: fillColors ?? AppColors.greyLight,
              ),
        ),
      ],
    );
  }
}
