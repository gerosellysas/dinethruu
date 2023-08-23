import 'package:dinethruu/controllers/summaryController.dart';
import 'package:dinethruu/pages/transactionHistory/components/customDIalogBox.dart';
import 'package:dinethruu/pages/transactionHistory/components/displayCalendar.dart';
import 'package:dinethruu/utils/utilDate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateFilterController extends GetxController {
  // final SummaryController summaryController = Get.put(SummaryController());

  var startDateController = TextEditingController().obs;
  var endDateController = TextEditingController().obs;
  var focusStartDate = Date.now.obs;
  var selectStartDate = Date.now.obs;
  var focusEndDate = Date.now.obs;
  var selectEndDate = Date.now.obs;
  var isFilter = false.obs;

  onStartDateTapped() async {
    await onStartDateClose();
    await Get.dialog(
      Obx(
        () => CustomDialogBox(
          child: CalendarDisplay(
            focusDate: focusStartDate.value,
            selectDate: selectStartDate.value,
            selectedDayPredicate: (selectStartDate, focusStartDate) {
              onStartDateCalendarSelectedDayTap(
                  selectStartDate, focusStartDate);
            },
            onHeaderTapped: (startDate) {
              onStartDateCalendarHeaderTap(startDate);
            },
          ),
        ),
      ),
    );
    if (selectStartDate.value != null) {
      startDateController.value.text =
          Date.dateFormat.format(selectStartDate.value);
    }
  }

  onStartDateClose() {
    if (startDateController.value.text != "") {
      focusStartDate.value =
          Date.parseDateFormat.parse(startDateController.value.text);
      selectStartDate.value =
          Date.parseDateFormat.parse(startDateController.value.text);
    }
  }

  onStartDateCalendarSelectedDayTap(
      DateTime onStartSelect, DateTime onStartFocus) async {
    selectStartDate.value = onStartSelect;
    focusStartDate.value = onStartSelect;
    await Future.delayed(
      Duration(milliseconds: 350),
      () {
        Get.back();
      },
    );
  }

  onStartDateCalendarHeaderTap(DateTime onStartDate) {
    focusStartDate.value = onStartDate;
  }

  Future<void> onEndDateTapped() async {
    print("endDate running");
    isFilter.value = false;
    await onEndDateClose();
    await Get.dialog(
      Obx(
        () => CustomDialogBox(
          child: CalendarDisplay(
            focusDate: focusEndDate.value,
            selectDate: selectEndDate.value,
            selectedDayPredicate: (selectEndDate, focusEndDate) {
              onEndDateCalendarSelectedDayTap(selectEndDate, focusEndDate);
            },
            onHeaderTapped: (endDate) {
              onEndDateCalendarHeaderTap(endDate);
            },
            enabledDayPredicate: (endDate) {
              if (endDate.isBefore(selectStartDate.value)) {
                return false;
              }
              return true;
            },
          ),
        ),
      ),
    );
    if (selectEndDate.value != null) {
      endDateController.value.text =
          Date.dateFormat.format(selectEndDate.value);
      // if (startDateController.value.text ==
      //     endDateController.value.text) {
      //   dateBarTextInput.value = endDateController.value.text;
      // } else {
      //   dateBarTextInput.value = startDateController.value.text +
      //       " - " +
      //       endDateController.value.text;
      // }
      // Get.back();
    }
  }

  onEndDateClose() {
    if (endDateController.value.text != "") {
      focusEndDate.value =
          Date.parseDateFormat.parse(endDateController.value.text);
      selectEndDate.value =
          Date.parseDateFormat.parse(endDateController.value.text);
    }
  }

  onEndDateCalendarSelectedDayTap(
      DateTime onEndSelect, DateTime onEndFocus) async {
    selectEndDate.value = onEndSelect;
    focusEndDate.value = onEndSelect;

    // await Future.delayed(
    //   Duration(milliseconds: 350),
    //   () async {
    //     await
    // await summaryController.filterByDate(selectStartDate.value, selectEndDate.value);
    Get.back(result: "reload");
    isFilter.value = true;
    // print("start ${selectStartDate.value}");
    // print("end ${selectEndDate.value}");

    // DateTime tempDate =
    //     new DateFormat("yyyy-MM-dd hh:mm").parse("2021-05-05 00:00");
    // print('test ${tempDate}');

    // var x = selectStartDate.value.isAfter(tempDate);
    // print("x $x");
    //   },
    // );
  }

  onEndDateCalendarHeaderTap(DateTime onEndDate) {
    focusEndDate.value = onEndDate;
  }

  enabledEnDatePredicate(DateTime onEndDate) {
    if (onEndDate.isBefore(selectStartDate.value)) {
      return false;
    }
  }
}
