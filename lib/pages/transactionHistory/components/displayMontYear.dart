import 'package:dinethruu/pages/transactionHistory/components/customDIalogBox.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MonthYearDisplay extends StatefulWidget {
  final DateTime defaultMonthYear;

  const MonthYearDisplay({Key key, this.defaultMonthYear})
      : super(key: key);

  @override
  _MonthYearDisplay createState() => _MonthYearDisplay();
}

class _MonthYearDisplay extends State<MonthYearDisplay> {
  DateTime selectMonthYear;
  int displayedYear;
  PageController pageController;

  @override
  void initState() {
    selectMonthYear = widget.defaultMonthYear;
    displayedYear = selectMonthYear.year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialogBox(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                buildHeader(context),
                Row(
                  children: [
                    Expanded(
                      child: buildPager(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildHeader(BuildContext context) {
    pageController = PageController(initialPage: displayedYear);
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.maxFinite,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                pageController.animateToPage(
                  displayedYear - 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              borderRadius: BorderRadius.circular(100.0),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.chevron_left,
                  color: UtilColors.calendarYearBarText,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "${DateFormat.y().format(DateTime(displayedYear))}",
                style: TextStyle(
                  color: UtilColors.calendarYearBarText,
                  fontSize: UtilString.calendarYearBarText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                pageController.animateToPage(
                  displayedYear + 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              borderRadius: BorderRadius.circular(100.0),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.chevron_right,
                  color: UtilColors.calendarYearBarText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildPager(BuildContext context) {
    pageController = PageController(initialPage: displayedYear);
    return Container(
      height: 250.0,
      width: double.maxFinite,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            displayedYear = index;
          });
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, year) {
          return GridView.count(
            padding: EdgeInsets.all(12.0),
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: List<int>.generate(12, (i) => i + 1)
                .map((month) => DateTime(year, month))
                .map(
                  (date) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      setState(() {
                        selectMonthYear = date;
                      });
                      await Future.delayed(
                        Duration(milliseconds: 250),
                        () {
                          Get.back(result: selectMonthYear);
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: date.month == selectMonthYear.month &&
                                date.year == selectMonthYear.year
                            ? UtilColors.calendarSelectedMonthBg
                            : UtilColors.calendarBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        DateFormat.MMM().format(date),
                        style: TextStyle(
                          fontSize: UtilString.calendarMonthYearText,
                          fontWeight: FontWeight.bold,
                          color: date.month == selectMonthYear.month &&
                                  date.year == selectMonthYear.year
                              ? UtilColors.calendarSelectedMonth
                              : date.month == DateTime.now().month &&
                                      date.year == DateTime.now().year
                                  ? UtilColors.calendarSelectedMonthBg
                                  : UtilColors.calendarActiveMonth,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
