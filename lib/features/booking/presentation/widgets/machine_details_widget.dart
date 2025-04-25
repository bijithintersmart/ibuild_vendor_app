import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibuild_vendor/core/constant/app_assets.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/features/booking/data/models/equiment_model.dart';
import 'package:intl/intl.dart';

class MachineDetails extends StatelessWidget {
  const MachineDetails({
    super.key,
    required this.booking,
  });

  final EquipmentBooking booking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(booking.name,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                  Text(booking.type,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.greyDark,
                          )),
                  Text('Capacity: ${booking.capacity}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.greyDark,
                          )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if(booking.status == BookingStatus.completed)
                    Text(DateFormat("dd MMMM yyyy").format(booking.bookingDate),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.greyDark,
                            ))
                  else
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppSvgs.booking,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Booking',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (booking.status != BookingStatus.completed)
                  Text(DateFormat("dd MMMM yyyy").format(booking.bookingDate),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.greyDark,
                          )),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      text: 'KWD ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                      children: [
                        TextSpan(
                          text: booking.pricePerDay.toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w500,
                                  ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          booking.status == BookingStatus.pending
              ? Column(
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppColors.greyDark.withOpacity(.4),
                              minimumSize: const Size(double.infinity, 30),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.symmetric(
                                vertical: 9,
                              ),
                            ),
                            child: Text(
                              'REJECT',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      letterSpacing: .7,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.symmetric(
                                vertical: 9,
                              ),
                              backgroundColor: Colors.orange,
                            ),
                            child: Text(
                              'APPROVE',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      letterSpacing: .7,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
