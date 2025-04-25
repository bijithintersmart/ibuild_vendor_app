import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/features/details/domain/services/booking_calendar_service.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';
import 'package:ibuild_vendor/features/details/presentation/widgets/month_picker_dialog.dart';
enum DateType { disabled, highlighted, sameDay, selected }
class BookingCalendarView extends StatefulWidget {
  const BookingCalendarView({super.key});

  @override
  State<BookingCalendarView> createState() => _BookingCalendarViewState();
}

class _BookingCalendarViewState extends State<BookingCalendarView>
    with TickerProviderStateMixin {
  late final BookingCalendarService _service;
  late final AnimationController _calendarAnimController;

  @override
  void initState() {
    super.initState();
    _service = BookingCalendarService();

    _calendarAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();
  }

  @override
  void dispose() {
    _calendarAnimController.dispose();
    super.dispose();
  }

  Color _getDateColor(DateTime day) {
    if (_service.isDisabled(day)) {
      return Colors.red;
    } else if (_service.isHighlighted(day)) {
      return AppColors.secondary;
    } else if (_service.isSameDay(day, _service.selectedDay!)) {
      return Colors.blue;
    }
    return Colors.black;
  }

  void _showMonthYearPicker() {
    showDialog(
      context: context,
      builder: (context) => MonthYearPickerDialog(
        initialDate: _service.focusedDay,
        lastYear: _service.lastDay.year,
        onDateSelected: (newDate) {
          setState(() {
            _service.focusedDay = newDate;
            _calendarAnimController.reset();
            _calendarAnimController.forward(from: 0);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const _NoScrollBehavior(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(128, 128, 128, 0.1),
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            _buildCalendar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: _showMonthYearPicker,
            child: Row(
              children: [
                Text(
                  _service.formattedFocusedDate,
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.expand_less_rounded,
                      color: Colors.orange, size: 30),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon:
                const Icon(Icons.chevron_left, color: Colors.orange, size: 35),
            onPressed: () {
              setState(() {
                _service.changeMonthBackward();
                _calendarAnimController.forward(from: 0);
              });
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.chevron_right, color: Colors.orange, size: 35),
            onPressed: () {
              setState(() {
                _service.changeMonthForawrd();
                _calendarAnimController.forward(from: 0);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return FadeTransition(
      opacity: _calendarAnimController,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_calendarAnimController),
        child: TableCalendar(
          firstDay: _service.firstDay,
          lastDay: _service.lastDay,
          focusedDay: _service.focusedDay,
          calendarFormat: CalendarFormat.month,
          availableGestures: AvailableGestures.horizontalSwipe,
          headerVisible: false,
          daysOfWeekVisible: true,
          headerStyle: const HeaderStyle(),
          selectedDayPredicate: (day) {
            return _service.isSameDay(_service.selectedDay!, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            // Don't allow selection of disabled dates
            if (_service.isDisabled(selectedDay)) {
              scaffoldToast("this data is disabled");
              return;
            }

            setState(() {
              _service.selectedDay = selectedDay;
              _service.focusedDay = focusedDay;
            });
          },
          onPageChanged: (focusedDay) {
            final clampedFocusedDay = focusedDay.isAfter(_service.lastDay)
                ? _service.lastDay
                : focusedDay.isBefore(_service.firstDay)
                    ? _service.firstDay
                    : focusedDay;

            setState(() {
              _service.focusedDay = clampedFocusedDay;
              _calendarAnimController.reset();
              _calendarAnimController.forward();
            });
          },
          calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              disabledTextStyle:
                  TextStyle(color: Colors.brown.withOpacity(.8))),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final isDisabled = _service.isDisabled(day);
              final isHighlighted = _service.isHighlighted(day);
              // Special styling for highlighted dates
              if (isHighlighted && !isDisabled) {
                return _buildDateText(day);
              }
              // Disabled dates styling
              if (isDisabled) {
                return _buildDateText(day);
              }
              // Regular styling for normal days
              return _buildDateText(day);
            },
            selectedBuilder: (context, day, focusedDay) {
              return Container(
                margin: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${day.day}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            todayBuilder: (context, day, focusedDay) {
              final isDisabled = _service.isDisabled(day);
              final isSelected = _service.isSameDay(day, _service.selectedDay!);

              if (isSelected) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return Container(
                margin: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.orange, width: 1),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: isDisabled ? TextDecoration.lineThrough : null,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDateText(DateTime day) {
    return Container(
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      child: Text(
        '${day.day}',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: _getDateColor(day),
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class _NoScrollBehavior extends ScrollBehavior {
  const _NoScrollBehavior();
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const NeverScrollableScrollPhysics();
}
