import 'package:flutter/material.dart';
import 'package:ibuild_vendor/features/details/presentation/widgets/booking_calendar_view.dart';
import 'package:ibuild_vendor/features/details/presentation/widgets/booking_option_widget.dart';
import 'package:ibuild_vendor/features/equipments/data/models/subcategory_model.dart';

class BookingDatePickerScreen extends StatefulWidget {
  final List<SubcategoryModel> equipments;
  const BookingDatePickerScreen({super.key, required this.equipments});

  @override
  State<BookingDatePickerScreen> createState() =>
      _BookingDatePickerScreenState();
}

class _BookingDatePickerScreenState extends State<BookingDatePickerScreen>
    with TickerProviderStateMixin {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Booking Request',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Date',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            const BookingCalendarView(),
            const SizedBox(height: 24),
            BookingOptionWidget(
              equipments: widget.equipments,
            ),
          ],
        ),
      ),
    );
  }
  
}
