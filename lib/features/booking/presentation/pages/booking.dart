import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';

import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:ibuild_vendor/features/booking/data/models/equiment_model.dart';
import 'package:ibuild_vendor/features/booking/presentation/widgets/completed_card_widget.dart';

import 'package:ibuild_vendor/features/booking/presentation/widgets/pending_card_widget.dart';

import '../widgets/confirmed_card_widget.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    super.key,
    this.initalTabIndex = 0,
  });
  final int initalTabIndex;

  @override
  State<BookingScreen> createState() => _BookingCenterScreenState();
}

class _BookingCenterScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  int currentTabIndex = 0;
  final Set<String> _expandedCards = {};
  final List<String> _tabs = ['Pending', 'Confirmed', 'Completed'];

  @override
  void initState() {
    currentTabIndex = widget.initalTabIndex;
    tabController = FTabController(
      // initialIndex: widget.initalTabIndex,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  bool isExpanded(String bookingId) {
    return _expandedCards.contains(bookingId);
  }

  Widget _buildPendingList() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: 20,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: pendingBookings.length,
        itemBuilder: (context, index) {
          final booking = pendingBookings[index];
          return PendingCardWidget(booking: booking);
        },
      ),
    );
  }

  void _toggleExpanded(String bookingId) {
    setState(() {
      if (_expandedCards.contains(bookingId)) {
        _expandedCards.remove(bookingId);
      } else {
        _expandedCards.add(bookingId);
      }
    });
  }

  Widget _buildConfirmedList() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: 20,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: confirmBooking.length,
        shrinkWrap: true,
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
  }

  Widget _buildCompletedList() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: 20,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: completedBooking.length,
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
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabItems = [
      _buildPendingList(),
      _buildConfirmedList(),
      _buildCompletedList()
    ];
    return Scaffold(
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
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Builder(builder: (context) {
            tabController?.animateTo(widget.initalTabIndex,
                duration: const Duration(
                  milliseconds: 400,
                ),
                curve: Curves.easeIn);
            return FTabs(
                onPress: (value) {
                  currentTabIndex = value;
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
                      .copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                  unselectedLabelTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                  indicatorDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.secondary,
                  ),
                  focusedOutlineStyle: FFocusedOutlineStyle(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondary,
                  ),
                ),
                tabs: List.generate(_tabs.length, (index) {
                  return FTabEntry(
                    label: Text(_tabs[index]),
                    content: _tabItems[index],
                  );
                }));
          }),
        ));
  }
}
