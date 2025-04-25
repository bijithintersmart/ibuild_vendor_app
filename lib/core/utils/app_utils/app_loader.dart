import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/loading.dart';

class AppLoader {
  static void easyLoader({
    bool dismissOnTap = false,
    Widget? indicator,
    double? loaderWidgetSize,
    EasyLoadingMaskType? maskType = EasyLoadingMaskType.black,
  }) {
    EasyLoading.show(
      indicator: indicator ??
          AppLoaderWidget(
            loaderWidgetSize: loaderWidgetSize ?? 75,
          ),
      dismissOnTap: dismissOnTap,
      maskType: maskType,
    );
  }
}
