import 'package:dinethruu/pages/transactionHistory/components/displayMontYear.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilDate.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDisplay extends StatelessWidget {
  final DateTime focusDate;
  final DateTime selectDate;
  final void Function(DateTime date) onHeaderTapped;
  final void Function(DateTime select, DateTime focus) selectedDayPredicate;
  final bool Function(DateTime day) enabledDayPredicate;

  const CalendarDisplay({
    Key key,
    this.focusDate,
    this.selectDate,
    this.onHeaderTapped,
    this.selectedDayPredicate,
    this.enabledDayPredicate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _focusDate = focusDate;
    DateTime _selectDate = selectDate;

    return TableCalendar(
      focusedDay: _focusDate,
      firstDay: DateTime(2000),
      lastDay: DateTime(2100),
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.horizontalSwipe,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      weekendDays: [DateTime.sunday],
      rowHeight: 45,
      daysOfWeekHeight: 50,
      headerVisible: true,
      calendarFormat: CalendarFormat.month,
      daysOfWeekVisible: true,
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextStyle: TextStyle(
          color: UtilColors.calendarMonthBarText,
          fontSize: UtilString.calendarMonthBarText,
          fontWeight: FontWeight.w600,
        ),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: UtilColors.calendarMonthBarText,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: UtilColors.calendarMonthBarText,
        ),
      ),
      onHeaderTapped: (date) async {
        date = await Get.dialog<DateTime>(
          MonthYearDisplay(
            defaultMonthYear: _focusDate,
          ),
        );
        if (date != null && date != focusDate) onHeaderTapped(date);
      },
      onDaySelected: (thisSelect, thisFocus) {
        selectedDayPredicate(thisSelect, thisFocus);
      },
      enabledDayPredicate: enabledDayPredicate,
      onPageChanged: (focus) {
        _focusDate = focus;
        return true;
      },
      selectedDayPredicate: (day) {
        _focusDate = day;
        return isSameDay(_selectDate, day);
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        defaultTextStyle: TextStyle(
          color: UtilColors.calendarActiveDays,
          fontSize: UtilString.calendarDays,
        ),
        weekendTextStyle: TextStyle(
          color: UtilColors.calendarWeekEnd,
          fontSize: UtilString.calendarDays,
        ),
        outsideTextStyle: TextStyle(
          color: UtilColors.calendarInactiveDays,
          fontSize: UtilString.calendarDays,
        ),
        disabledTextStyle: TextStyle(
          color: UtilColors.calendarInactiveDays,
          fontSize: UtilString.calendarDays,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, date, _) => Container(
          margin: const EdgeInsets.all(2.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _focusDate == Date.now && _selectDate == Date.now
                ? UtilColors.calendarSelectedDayBg
                : UtilColors.calendarBg,
            border: Border.all(
              color: UtilColors.calendarTodayBorder,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            date.day.toString(),
            style: TextStyle(
              color: _focusDate == Date.now && _selectDate == Date.now
                  ? UtilColors.calendarSelectedDay
                  : UtilColors.calendarActiveDays,
              fontWeight: FontWeight.bold,
              fontSize: UtilString.calendarSelectedDays,
            ),
          ),
        ),
        selectedBuilder: (context, date, _) => Container(
          margin: const EdgeInsets.all(2.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: UtilColors.calendarSelectedDayBg,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            date.day.toString(),
            style: TextStyle(
              color: UtilColors.calendarSelectedDay,
              fontSize: UtilString.calendarSelectedDays,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        dowBuilder: (context, date) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: UtilColors.calendarBg,
            border: Border(
              top: BorderSide(color: UtilColors.calendarDowDivider),
              bottom: BorderSide(color: UtilColors.calendarDowDivider),
            ),
          ),
          child: date.weekday == 1
              ? Text(
                  "Mon",
                  style: TextStyle(
                    color: UtilColors.calendarDaysOfWeek,
                    fontSize: UtilString.calendarDaysOfWeekText,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : date.weekday == 2
                  ? Text(
                      "Tue",
                      style: TextStyle(
                        color: UtilColors.calendarDaysOfWeek,
                        fontSize: UtilString.calendarDaysOfWeekText,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : date.weekday == 3
                      ? Text(
                          "Wed",
                          style: TextStyle(
                            color: UtilColors.calendarDaysOfWeek,
                            fontSize: UtilString.calendarDaysOfWeekText,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : date.weekday == 4
                          ? Text(
                              "Thu",
                              style: TextStyle(
                                color: UtilColors.calendarDaysOfWeek,
                                fontSize: UtilString.calendarDaysOfWeekText,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : date.weekday == 5
                              ? Text(
                                  "Fri",
                                  style: TextStyle(
                                    color: UtilColors.calendarDaysOfWeek,
                                    fontSize: UtilString.calendarDaysOfWeekText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : date.weekday == 6
                                  ? Text(
                                      "Sat",
                                      style: TextStyle(
                                        color: UtilColors.calendarDaysOfWeek,
                                        fontSize:
                                            UtilString.calendarDaysOfWeekText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      "Sun",
                                      style: TextStyle(
                                        color: UtilColors.calendarWeekEnd,
                                        fontSize:
                                            UtilString.calendarDaysOfWeekText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
        ),
      ),
    );
  }
}
