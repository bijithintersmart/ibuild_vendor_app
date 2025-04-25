import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';

class MonthYearPickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final int lastYear;
  final Function(DateTime) onDateSelected;
  final DateTime? minDate;

  const MonthYearPickerDialog({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
    required this.lastYear,
    this.minDate,
  });

  @override
  State<MonthYearPickerDialog> createState() => _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends State<MonthYearPickerDialog> {
  late int _selectedYear;
  late int _selectedMonth;
  late int _currentYear;
  late int _currentMonth;
  late int _viewMode; 
  late List<int> _yearsToShow;

  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    _selectedYear = widget.initialDate.year;
    _selectedMonth = widget.initialDate.month;
    _currentYear = DateTime.now().year;
    _currentMonth = DateTime.now().month;
    _viewMode = 0; // Start with month selection
    _generateYearsToShow();
  }

  void _generateYearsToShow() {
    // Show a grid of years from current year to the lastYear
    final minYear = widget.minDate?.year ?? _currentYear;
    _yearsToShow = List.generate(
      widget.lastYear - minYear + 1,
      (index) => minYear + index,
    );
  }

  bool _isMonthDisabled(int month) {
    if (_selectedYear > _currentYear) return false;
    if (_selectedYear == _currentYear && month < _currentMonth) return true;

    // Additional check for minDate
    if (widget.minDate != null) {
      if (_selectedYear == widget.minDate!.year &&
          month < widget.minDate!.month) {
        return true;
      }
    }

    return false;
  }

  bool _isYearDisabled(int year) {
    final minYear = widget.minDate?.year ?? _currentYear;
    return year < minYear;
  }

  void _toggleViewMode() {
    setState(() {
      _viewMode = _viewMode == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = AppColors.secondary;
    const surfaceColor = Colors.white;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      backgroundColor: surfaceColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _toggleViewMode,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor.withValues(alpha: (0.3 * 255)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _viewMode == 0
                                ? '${_months[_selectedMonth - 1]} $_selectedYear'
                                : 'Select Year',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_drop_down,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Month or Year Grid
            if (_viewMode == 0)
              _buildMonthGrid(theme, primaryColor)
            else
              _buildYearGrid(theme, primaryColor),

            const SizedBox(height: 16),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 40),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'CANCEL',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 40),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      final newDate =
                          DateTime(_selectedYear, _selectedMonth, DateTime.now().day);
                      widget.onDateSelected(newDate);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'OK',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthGrid(ThemeData theme, Color primaryColor) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        final monthIndex = index + 1;
        final isDisabled = _isMonthDisabled(monthIndex);
        final isSelected = !isDisabled && monthIndex == _selectedMonth;

        return GestureDetector(
          onTap: isDisabled
              ? null
              : () {
                  setState(() {
                    _selectedMonth = monthIndex;
                  });
                },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.colorScheme.primary
                  : isDisabled
                      ? AppColors.greyDark
                      : AppColors.blackLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.transparent, width: 0),
            ),
            alignment: Alignment.center,
            child: Text(
              _months[index].substring(0, 3),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14,
                  ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildYearGrid(ThemeData theme, Color primaryColor) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 240),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: _yearsToShow.length,
        itemBuilder: (context, index) {
          final year = _yearsToShow[index];
          final isSelected = year == _selectedYear;
          final isDisabled = _isYearDisabled(year);

          return GestureDetector(
            onTap: isDisabled
                ? null
                : () {
                    setState(() {
                      _selectedYear = year;
                      _viewMode = 0; // Switch back to month selection
                    });
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.colorScheme.primary
                    : isDisabled
                        ? theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: (0.3 * 255))
                        : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                year.toString(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
