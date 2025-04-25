import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/dotted_line.dart';
import 'package:ibuild_vendor/features/booking/data/models/equiment_model.dart';
import 'package:ibuild_vendor/features/booking/presentation/widgets/machine_details_widget.dart';

class CompletedCardWidget extends StatelessWidget {
  final EquipmentBooking booking;
  final bool isExpanded;
  final VoidCallback onToggleExpanded;

  const CompletedCardWidget({
    super.key,
    required this.booking,
    required this.isExpanded,
    required this.onToggleExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      color: AppColors.cardGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orange[300],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(booking.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MachineDetails(booking: booking),
              InkWell(
                onTap: onToggleExpanded,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 14,
                            color: AppColors.greyDark,
                          ),
                          const SizedBox(width: 8),
                          Text('${booking.days} Days',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.greyDark)),
                        ],
                      ),
                      InkWell(
                        onTap: onToggleExpanded,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isExpanded)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount/Day',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.greyDark)
                        ),
                        Text(
                          'KWD ${booking.pricePerDay.toStringAsFixed(2)}',
                                                 style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.greyDark)

                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount ${booking.days} Days',
                                                 style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.greyDark)

                        ),
                        Text(
                          'KWD ${(booking.totalPrice ?? 0.0).toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.greyDark)
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    DashedLine(
                      direction: Axis.horizontal,
                      dashLength: 8,
                      dashThickness: 1,
                      dashSpacing: 6,
                      color: AppColors.greyDark.withOpacity(.2),
                      length: double.infinity,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: AppColors.secondaryDark,
                                    ),
                          ),
                          Text.rich(
                            TextSpan(
                                text: 'KWD ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                children: [
                                  TextSpan(
                                      text: (booking.totalPrice ?? 0.0)
                                          .toStringAsFixed(2),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.orange,
                                          ))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
