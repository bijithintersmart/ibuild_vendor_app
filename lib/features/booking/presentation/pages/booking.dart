import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:ibuild_vendor/features/booking/data/models/equiment_model.dart';
import 'package:ibuild_vendor/features/booking/presentation/widgets/completed_card_widget.dart';
import 'package:ibuild_vendor/features/booking/presentation/widgets/pending_card_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../widgets/confirmed_card_widget.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    super.key,
  });

  @override
  State<BookingScreen> createState() => _BookingCenterScreenState();
}

class _BookingCenterScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  int currentTabIndex = 0;
  late FTabController tabController;

  final Set<String> _expandedCards = {};
  final List<String> _tabs = ['Pending', 'Confirmed', 'Completed'];

  @override
  void initState() {
    super.initState();
    currentTabIndex = bookingTabNotifier;
    tabController = FTabController(
      length: _tabs.length,
      initialIndex: currentTabIndex,
      vsync: this,
      animationDuration: const Duration(
        milliseconds: 250,
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool isExpanded(String bookingId) => _expandedCards.contains(bookingId);

  Widget buildTabLabel(String label, int index) {
    final isSelected = currentTabIndex == index;
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
      child: Text(label),
    );
  }

  Widget buildPendingList() => Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          itemCount: pendingBookings.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final booking = pendingBookings[index];
            return PendingCardWidget(booking: booking);
          },
        ),
      );

  Widget buildConfirmedList() => Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: confirmBooking.length,
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final booking = confirmBooking[index];
            return ConfirmedCardWidget(
              booking: booking,
              isExpanded: isExpanded(booking.id),
              onToggleExpanded: () => _toggleExpanded(booking.id),
            );
          },
        ),
      );

  Widget buildCompletedList() => Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: completedBooking.length,
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final booking = completedBooking[index];
            return CompletedCardWidget(
              booking: booking,
              isExpanded: isExpanded(booking.id),
              onToggleExpanded: () => _toggleExpanded(booking.id),
            );
          },
        ),
      );

  void _toggleExpanded(String bookingId) {
    setState(() {
      _expandedCards.contains(bookingId)
          ? _expandedCards.remove(bookingId)
          : _expandedCards.add(bookingId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("booking-screen"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1) {
          setState(() {
            currentTabIndex = bookingTabNotifier;
            tabController.animateTo(currentTabIndex, curve: Curves.easeIn);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              navController.jumpToTab(0);
            },
          ),
          title: NormalText(
            text: 'Booking Center',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: FTabs(
            initialIndex: currentTabIndex,
            onPress: (value) {
              setState(() {
                currentTabIndex = value;
              });
            },
            controller: tabController,
            style: FTabsStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.cardGrey,
              ),
              selectedLabelTextStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              unselectedLabelTextStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
              indicatorDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.secondary,
              ),
              focusedOutlineStyle: FFocusedOutlineStyle(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.secondary,
              ),
            ),
            tabs: [
              FTabEntry(
                label: buildTabLabel(_tabs[0], 0),
                content: buildPendingList(),
              ),
              FTabEntry(
                label: buildTabLabel(_tabs[1], 1),
                content: buildConfirmedList(),
              ),
              FTabEntry(
                label: buildTabLabel(_tabs[2], 2),
                content: buildCompletedList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
