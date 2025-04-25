import 'package:flutter/material.dart';

class ShowDialogs {
  static bool isDialogShown = false;
  static Future<T?> alertDialog<T>(
    BuildContext context, {
    Widget? alertWidget,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    bool? barrierDismissible,
    Color? barrierColor,
    Color? backgroundColor,
  }) async {
    isDialogShown = true;
    return await showAdaptiveDialog(
        context: context,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible ?? false,
        builder: (context) {
          return alertWidget ??
              AlertDialog.adaptive(
                title: title,
                backgroundColor: backgroundColor,
                titlePadding: titlePadding,
                titleTextStyle: titleTextStyle,
                content: content,
                contentPadding: contentPadding,
                contentTextStyle: contentTextStyle,
                actions: actions,
                actionsAlignment: actionsAlignment,
                actionsPadding: actionsPadding,
              );
        });
  }
}
