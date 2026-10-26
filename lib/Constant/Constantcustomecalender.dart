import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCalendar extends StatefulWidget {
  final bool isRange;
  final DateTime? selectedDate;
  final DateTime? startDate;
  final DateTime? endDate;

  final Function(DateTime)? onDateSelected;
  final Function(DateTime, DateTime)? onRangeSelected;

  CustomCalendar({
    super.key,
    this.isRange = false,
    this.selectedDate,
    this.startDate,
    this.endDate,
    this.onDateSelected,
    this.onRangeSelected,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime currentMonth;
  DateTime? selectedDate;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();

    currentMonth = DateTime.now();
    selectedDate = widget.selectedDate;
    startDate = widget.startDate;
    endDate = widget.endDate;
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  void changeMonth(int value) {
    setState(() {
      currentMonth = DateTime(
        currentMonth.year,
        currentMonth.month + value,
      );
    });
  }

  void selectDay(DateTime date) {
    setState(() {
      if (widget.isRange) {
        if (startDate == null || endDate != null) {
          startDate = date;
          endDate = null;
        } else if (date.isBefore(startDate!)) {
          startDate = date;
          endDate = null;
        } else {
          endDate = date;
          widget.onRangeSelected?.call(startDate!, endDate!);
        }
      } else {
        selectedDate = date;
        widget.onDateSelected?.call(date);
      }
    });
  }

  bool isSameDay(DateTime? a, DateTime? b) {
    return a != null &&
        b != null &&
        a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }

  bool isInRange(DateTime date) {
    if (startDate == null || endDate == null) {
      return false;
    }

    return !date.isBefore(startDate!) &&
        !date.isAfter(endDate!);
  }

  @override
  Widget build(BuildContext context) {
    final firstDay =
    DateTime(currentMonth.year, currentMonth.month, 1);

    final daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

    final emptyDays = firstDay.weekday - 1;

    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => changeMonth(-1),
                icon: Icon(Icons.chevron_left),
              ),
              Text(
                '${_monthName(currentMonth.month)} '
                    '${currentMonth.year}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () => changeMonth(1),
                icon: Icon(Icons.chevron_right),
              ),
            ],
          ),
          Row(
            children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                .map(
                  (day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: emptyDays + daysInMonth,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              if (index < emptyDays) {
                return SizedBox();
              }

              final day = index - emptyDays + 1;
              final date = DateTime(
                currentMonth.year,
                currentMonth.month,
                day,
              );

              final isSelected = widget.isRange
                  ? isSameDay(date, startDate) ||
                  isSameDay(date, endDate)
                  : isSameDay(date, selectedDate);

              final inRange =
                  widget.isRange && isInRange(date);

              return GestureDetector(
                onTap: () => selectDay(date),
                child: Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue
                        : inRange
                        ? Colors.blue.withAlpha(30)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$day',
                    style: GoogleFonts.poppins(
                      color: isSelected
                          ? Colors.white
                          : Colors.black87,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 12),
          if (widget.isRange)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Start: ${startDate == null ? 'Select date' : formatDate(startDate!)}\n'
                    'End: ${endDate == null ? 'Select date' : formatDate(endDate!)}',
                style: TextStyle(fontSize: 13),
              ),
            )
          else
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selected: ${selectedDate == null ? 'No date selected' : formatDate(selectedDate!)}',
                style: TextStyle(fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }

  String _monthName(int month) {
    final months = [
      'January', 'February', 'March', 'April',
      'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December',
    ];

    return months[month - 1];
  }
}
