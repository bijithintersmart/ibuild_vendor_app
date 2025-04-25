// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class TabItemWidget extends StatelessWidget {
  final int tabIndex;
  final TabController tabController;final String title;
  const TabItemWidget({
    super.key,
    required this.tabIndex,
    required this.title, required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: tabController.index == tabIndex
            ? AppColors.secondary.withOpacity(.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: NormalText(
        text: title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight:tabController.index == tabIndex? FontWeight.bold:null,
            color: tabController.index == tabIndex
                ? AppColors.secondary
                : AppColors.greyDark),
      ),
    );
  }
}
