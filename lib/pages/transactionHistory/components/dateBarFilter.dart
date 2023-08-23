import 'package:dinethruu/utils/utilColors.dart';
import 'package:flutter/material.dart';

class DateBarFilter extends StatelessWidget {
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final Function onStartDateTap;
  final Function onEndDateTap;

  const DateBarFilter({
    Key key,
    this.startDateController,
    this.endDateController,
    this.onStartDateTap,
    this.onEndDateTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      height: w * 0.11, //50/441.43
      width: w,
      color: UtilColors.transactionHistoryDateBarFilterBg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: w * 0.02265),
              height: w * 0.11,
              child: TextField(
                controller: startDateController,
                onTap: onStartDateTap,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Start date",
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.03),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: UtilColors.transactionDateBarFilterBorder),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: UtilColors.transactionDateBarFilterBorder),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: UtilColors.transactionDateBarFilterBorder),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "    -   ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: w * 0.02265),
              height: w * 0.11,
              child: TextField(
                controller: endDateController,
                onTap: onEndDateTap,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "End date",
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.03),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: UtilColors.transactionDateBarFilterBorder),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: UtilColors.transactionDateBarFilterBorder),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: UtilColors.transactionDateBarFilterBorder),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
