import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';
import 'package:intl/intl.dart';

class BookingCalendarService {
  final int yearRange;
  final DateTime firstDay;
  final DateTime lastDay;

  late DateTime focusedDay;
  DateTime? selectedDay;

  final Set<DateTime> disabledDates = {};
  final Set<DateTime> highlightedDates = {};

  BookingCalendarService({this.yearRange = 4})
      : firstDay = DateTime.now(),
        lastDay = DateTime(DateTime.now().year + yearRange, 12, 31) {
    focusedDay = _clampDate(DateTime.now());
    selectedDay = focusedDay;
    _initializeSampleDates();
  }

  void _initializeSampleDates() {
    final base = DateTime(firstDay.year, firstDay.month, firstDay.day);
    disabledDates
      ..add(base.add(const Duration(days: 1)))
      ..add(base.add(const Duration(days: 2)))
      ..add(base.add(const Duration(days: 3)));
    // highlightedDates
    //   ..add(base.add(const Duration(days: 6)))
    //   ..add(base.add(const Duration(days: 7)))
    //   ..add(base.add(const Duration(days: 8)));
  }

  static DateTime _clampDate(DateTime date) {
    final now = DateTime.now();
    final last = DateTime(now.year + 3, 12, 31);
    if (date.isAfter(last)) return last;
    if (date.isBefore(now)) return now;
    return date;
  }

  bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool isDisabled(DateTime date) =>
      disabledDates.any((d) => isSameDay(d, date));

  bool isHighlighted(DateTime date) =>
      highlightedDates.any((d) => isSameDay(d, date));

  void selectDay(DateTime date) {
    if (!isDisabled(date)) {
      selectedDay = date;
      focusedDay = date;
    }
  }

  void changeMonthForawrd() {
    DateTime newFocusedDay = DateTime(focusedDay.year, focusedDay.month + 1, 1);
    if (!newFocusedDay.isAfter(lastDay)) {
      focusedDay = newFocusedDay;
    }
  }

  void changeMonthBackward() {
    DateTime currentMonthStart =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime newFocusedDay =
        DateTime(focusedDay.year, focusedDay.month - 1, DateTime.now().day);
    if (!newFocusedDay.isBefore(currentMonthStart)) {
      focusedDay = newFocusedDay;
    } else {
      scaffoldToast("You can't book on previous dates");
    }
  }

  String get formattedFocusedDate =>
      DateFormat('dd MMMM yyyy').format(focusedDay);
}
