// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onTap;
  const ProfileTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: onTap,
            child: ListTile(
              minVerticalPadding: 1,
              visualDensity: VisualDensity.compact,
              title: NormalText(
                text: title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: NormalText(
                text: subTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.greyDark.withOpacity(.8)),
              ),
              trailing: const RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.expand_more_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Divider(
          thickness: .5,
          color: AppColors.greyDark.withOpacity(.8),
        ),
      ],
    );
  }
}
