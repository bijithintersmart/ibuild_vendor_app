import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/features/booking/data/models/equiment_model.dart';
import 'package:ibuild_vendor/features/booking/presentation/widgets/machine_details_widget.dart';

class PendingCardWidget extends StatelessWidget {
  final EquipmentBooking booking;
  const PendingCardWidget({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.zero,
          elevation: 3,
          color: AppColors.cardGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        booking.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              MachineDetails(booking: booking),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        if (booking.status == BookingStatus.waitingApproval)
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Rejected',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
      ],
    );
  }
}
