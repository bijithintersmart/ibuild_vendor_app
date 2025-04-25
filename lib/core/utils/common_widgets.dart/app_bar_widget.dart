import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.leading,
    this.title,
    this.actions = const <Widget>[],
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.centerTitle,
    this.toolbarHeight,
    this.leadingWidth,
    this.backgroundColor,
    this.appBarHeight = kToolbarHeight,
    this.hideGradient = false,
  });

  final List<Widget> actions;
  final Widget? leading;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Widget? title;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? toolbarHeight;
  final double appBarHeight;
  final double? leadingWidth;
  final bool hideGradient;
  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      height: appBarHeight + 60,
      alignment: Alignment.center,
      decoration: hideGradient
          ? null
          : BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black.withOpacity(0.6),
                  AppColors.black.withOpacity(0.3),
                  AppColors.transparent,
                ],
              ),
            ),
      child: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: backgroundColor ?? Colors.transparent,
        surfaceTintColor: backgroundColor ?? Colors.transparent,
        foregroundColor: backgroundColor ?? Colors.transparent,
        backgroundColor: backgroundColor ?? Colors.transparent,
        leadingWidth: leadingWidth,
        elevation: elevation,
        centerTitle: centerTitle,
        toolbarHeight: toolbarHeight,
        titleSpacing: 10,
        flexibleSpace: flexibleSpace,
        bottom: bottom,
        leading: leading,
        title: title,
        actions: actions,
      ),
    );
  }
}
