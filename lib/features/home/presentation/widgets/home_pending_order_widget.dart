import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class HomePendingOrderWidget extends StatefulWidget {
  const HomePendingOrderWidget({super.key});

  @override
  State<HomePendingOrderWidget> createState() => _HomePendingOrderWidgetState();
}

class _HomePendingOrderWidgetState extends State<HomePendingOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(
            text: "Pending Orders",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(
              height: 10,
            ),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (_, i) {
              return ListTile(
                tileColor: Colors.grey.withOpacity(.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: AppColors.secondary,
                    )),
                enableFeedback: true,
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cardGrey,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.hourglass_bottom_rounded,
                    color: AppColors.secondary,
                  ),
                ),
                title: NormalText(
                  text: "Order ${generateOrderCode(i)}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: NormalText(
                  text: "Pending",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.greyDark,
                      ),
                ),
                trailing: Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.secondary.withOpacity(.8),
                  size: 30,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
